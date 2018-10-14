import ml.combust.bundle.BundleFile
import ml.combust.mleap.runtime.MleapSupport._

import ml.combust.mleap.runtime.serialization.FrameReader

import resource._

import ml.combust.mleap.runtime.MleapSupport
import ml.combust.bundle.BundleFile

// MLeap/Bundle.ML Serialization Libraries
import ml.combust.mleap.spark.SparkSupport._
import resource._
import ml.combust.bundle.BundleFile
import org.apache.spark.ml.bundle.SparkBundleContext

import ml.combust.mleap.runtime.MleapSupport._
import ml.combust.mleap.runtime.MleapContext.defaultContext
import java.io.File

import org.apache.spark.ml.mleap.SparkUtil


object PipelineInvokeJvm {

 def main(args: Array[String]): Unit = {
  // load the Spark pipeline we saved in the previous section
  val mleapPipeline = (for(bf <- managed(BundleFile("jar:file:./mnist-spark-pipeline.zip"))) yield {
      bf.loadMleapBundle().get.root
    }).tried.get

  val s = scala.io.Source.fromURL("file:///./pipeline_request_input.json").mkString

  val bytes = s.getBytes("UTF-8")
  val frame = FrameReader("pipeline_request_input.json").fromBytes(bytes)

  // transform the dataframe using our pipeline
  val frame2 = mleapPipeline.transform(frame).get
  val data = frame2.dataset
  System.println(data)
}
}
