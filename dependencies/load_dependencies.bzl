load("@rules_jvm_external//:defs.bzl", "maven_install")
load("@rules_jvm_external//:repositories.bzl", "rules_jvm_external_deps")

def load_checkstyle_dependencies():
    rules_jvm_external_deps()
    maven_install(
        name = "rules_checkstyle_dependencies",
        artifacts = [
            "com.puppycrawl.tools:checkstyle:10.1",
        ],
        repositories = [
            "https://repo1.maven.org/maven2",
            "https://repo.maven.apache.org/maven2/",
        ],
        maven_install_json = "@rules_checkstyle//:rules_checkstyle_dependencies_install.json",
    )
