load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def load_checkstyle_rule_dependencies():
    # JVM External
    RULES_JVM_EXTERNAL_COMMITISH = "5.2"
    RULES_JVM_EXTERNAL_SHA = "3824ac95d9edf8465c7a42b7fcb88a5c6b85d2bac0e98b941ba13f235216f313"
    maybe(
        http_archive,
        name = "rules_jvm_external",
        sha256 = RULES_JVM_EXTERNAL_SHA,
        strip_prefix = "rules_jvm_external-{}".format(RULES_JVM_EXTERNAL_COMMITISH),
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/{}.zip".format(RULES_JVM_EXTERNAL_COMMITISH),
    )
