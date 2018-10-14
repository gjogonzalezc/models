// Note that we are taking advantage of com.databricks:spark-csv package to load the data
import org.apache.spark.ml.feature.{VectorAssembler,StringIndexer,IndexToString, Binarizer}
import org.apache.spark.ml.classification.{RandomForestClassificationModel, RandomForestClassifier}
import org.apache.spark.ml.evaluation.{MulticlassClassificationEvaluator}
import org.apache.spark.ml.{Pipeline,PipelineModel}  
import org.apache.spark.ml.feature.PCA

val datasetPath = "./mnist_train.csv"
var dataset = spark.sqlContext.read.format("com.databricks.spark.csv").
                 option("header", "true").
                 option("inferSchema", "true").
                 load(datasetPath)
                 
val testDatasetPath = "./mnist_test.csv"
var test = spark.sqlContext.read.format("com.databricks.spark.csv").
                 option("inferSchema", "true").
                 option("header", "true").
                 load(testDatasetPath)

// Define Dependent and Independent Features
val predictionCol = "label"
val labels = Seq("0","1","2","3","4","5","6","7","8","9")  
val pixelFeatures = (0 until 784).map(x => s"x$x").toArray

val layers = Array[Int](pixelFeatures.length, 784, 800, labels.length)

val vector_assembler = new VectorAssembler()  
  .setInputCols(featureColumns)
  .setOutputCol("features")

val stringIndexer = { new StringIndexer()  
  .setInputCol(predictionCol)
  .setOutputCol("label_index")
  .fit(dataset)
}
  
val binarizer = new Binarizer()  
  .setInputCol(vector_assembler.getOutputCol)
  .setThreshold(127.5)
  .setOutputCol("binarized_features")
  
val pca = new PCA().
  setInputCol(binarizer.getOutputCol).
  setOutputCol("pcaFeatures").
  setK(10)

val featurePipeline = new Pipeline().setStages(Array(vector_assembler, stringIndexer, binarizer, pca))

// Transform the raw data with the feature pipeline and persist it
val featureModel = featurePipeline.fit(dataset)

val datasetWithFeatures = featureModel.transform(dataset)

// Select only the data needed for training and persist it
val datasetPcaFeaturesOnly = datasetWithFeatures.select(stringIndexer.getOutputCol, pca.getOutputCol)
val datasetPcaFeaturesOnlyPersisted = datasetPcaFeaturesOnly.persist()

val rf = new RandomForestClassifier().
      setFeaturesCol(pca.getOutputCol).
      setLabelCol(stringIndexer.getOutputCol).
      setPredictionCol("prediction").
      setProbabilityCol("probability").
      setRawPredictionCol("raw_prediction")

val rfModel = rf.fit(datasetPcaFeaturesOnlyPersisted)

import org.apache.spark.ml.mleap.SparkUtil

val pipeline = SparkUtil.createPipelineModel(uid = "pipeline", Array(featureModel, rfModel))

val sbc = SparkBundleContext()
for(bf <- managed(BundleFile("jar:file:/tmp/mnist.model.rf.zip"))) {
        pipeline.writeBundle.save(bf)(sbc).get
}

