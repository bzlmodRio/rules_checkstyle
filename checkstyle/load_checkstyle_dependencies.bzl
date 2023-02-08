load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@rules_jvm_external//:specs.bzl", "maven")

def load_checkstyle_dependencies():
    maven_install(
        name = "rules_checkstyle_dependencies",
        artifacts = [
            maven.artifact("com.puppycrawl.tools", "checkstyle", "10.1"),
        ],
        repositories = [
            "https://repo1.maven.org/maven2",
            "https://repo.maven.apache.org/maven2/",
        ],
    )
