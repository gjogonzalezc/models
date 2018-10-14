// Note that we are taking advantage of com.databricks:spark-csv package to load the data
import org.apache.spark.ml.feature.{VectorAssembler,StringIndexer,IndexToString, Binarizer}
import org.apache.spark.ml.classification.{RandomForestClassificationModel, RandomForestClassifier}
import org.apache.spark.ml.evaluation.{MulticlassClassificationEvaluator}
import org.apache.spark.ml.{Pipeline,PipelineModel}  
import org.apache.spark.ml.feature.PCA

import ml.combust.bundle.BundleFile
import ml.combust.mleap.MleapSupport._

// load the Spark pipeline we saved in the previous section
val bundle = BundleFile("/tmp/mnist-spark-pipeline.zip").load().get

import ml.combust.mleap.runtime.serialization.FrameReader

val s = scala.io.Source.fromURL("file:///./mleap-demo/mnist.json").mkString

val bytes = s.getBytes("UTF-8")
val frame = FrameReader("ml.combust.mleap.json").fromBytes(bytes)

// transform the dataframe using our pipeline
val mleapPipeline = bundle.root
val frame2 = mleapPipeline.transform(frame).get
val data = frame2.dataset
