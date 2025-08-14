import com.android.build.gradle.BaseExtension
import org.gradle.api.Project
allprojects {
    repositories {
        google()
        mavenCentral()
    }

     subprojects {
        afterEvaluate {
            if (hasProperty("android")) {
                extensions.configure(BaseExtension::class.java) {
                    if (namespace == null) {
                        namespace = group.toString()
                    }
                }
            }
        }
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
