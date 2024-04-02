workspace(name = "rules_checkstyle")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# WPI Formatter
http_archive(
    name = "rules_wpiformat",
    sha256 = "af167c15cfc3430901b0d6a19ed949b306887b1b079eabb24789a54d82371a62",
    url = "https://github.com/bzlmodRio/rules_wpiformat/releases/download/2024.34/rules_wpiformat-2024.34.tar.gz",
)

load("@rules_wpiformat//dependencies:load_rule_dependencies.bzl", "load_wpiformat_rule_dependencies")

load_wpiformat_rule_dependencies()

load("@rules_wpiformat//dependencies:load_transitive_dependencies.bzl", "load_wpiformat_transitive_dependencies")

load_wpiformat_transitive_dependencies()

load("@rules_wpiformat//dependencies:load_dependencies.bzl", "load_wpiformat_dependencies")

load_wpiformat_dependencies()

load("@rules_wpiformat_pip//:requirements.bzl", "install_deps")

install_deps()

# Rule Dependencies
load("//dependencies:load_rule_dependencies.bzl", "load_checkstyle_rule_dependencies")

load_checkstyle_rule_dependencies()

# Transitive Dependencies
load("//dependencies:load_dependencies.bzl", "load_checkstyle_dependencies")

load_checkstyle_dependencies()

# Pin the maven install
load("@rules_checkstyle_dependencies//:defs.bzl", "pinned_maven_install")

pinned_maven_install()
