name := "example-project"
version := "1.0"
scalaVersion := "2.12.2"
crossScalaVersions := Seq("2.11.11")

libraryDependencies ++= {
 // organizations
 val akka = "com.typesafe.akka"
 val logback = "ch.qos.logback"
 val groovy = "org.codehaus.groovy"
 val slf4j = "org.slf4j"
 val scalatest = "org.scalatest"

 // versions
 val akkaV = "2.5.3"
 val akkaHttpV = "10.0.9"
 val logbackV = "1.2.3"
 val groovyV = "2.4.12"
 val scalatestV = "3.0.3"

 Seq(
   akka          %% "akka-actor"               % akkaV,
   akka          %% "akka-testkit"             % akkaV,
   akka          %% "akka-slf4j"               % akkaV,
   akka          %% "akka-stream"              % akkaV,
   akka          %% "akka-stream-testkit"      % akkaV % Test,
   akka          %% "akka-http"                % akkaHttpV,
   akka          %% "akka-http-testkit"        % akkaHttpV % Test,
   scalatest     %% "scalatest"                % scalatestV % Test,
   logback        % "logback-classic"          % logbackV,
   groovy         % "groovy"                   % groovyV
 )
}
