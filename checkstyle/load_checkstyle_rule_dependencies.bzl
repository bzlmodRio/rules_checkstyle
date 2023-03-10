load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def load_checkstyle_rule_dependencies():
    # Java
    RULES_JAVA_COMMITISH = "5.3.5"
    RULES_JAVA_SHA = "7df0811e29830e79be984f9d5bf6839ce151702d694038126d7c23296785bf97"
    maybe(
        http_archive,
        name = "rules_java",
        sha256 = RULES_JAVA_SHA,
        strip_prefix = "rules_java-{}".format(RULES_JAVA_COMMITISH),
        url = "https://github.com/bazelbuild/rules_java/archive/{}.tar.gz".format(RULES_JAVA_COMMITISH),
    )

    # JVM External
    RULES_JVM_EXTERNAL_TAG = "4.4.2"
    RULES_JVM_EXTERNAL_SHA = "735602f50813eb2ea93ca3f5e43b1959bd80b213b836a07a62a29d757670b77b"
    maybe(
        http_archive,
        name = "rules_jvm_external",
        sha256 = RULES_JVM_EXTERNAL_SHA,
        strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
    )
