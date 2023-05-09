workspace(name = "rules_checkstyle")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# WPI Formatter
local_repository(
    name = "rules_wpiformat",
    path = "../../rules/rules_wpiformat",
)

http_archive(
    name = "rules_python",
    sha256 = "48a838a6e1983e4884b26812b2c748a35ad284fd339eb8e2a6f3adf95307fbcd",
    strip_prefix = "rules_python-0.16.2",
    url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.16.2.tar.gz",
)

load("@rules_wpiformat//dependencies:load_rule_dependencies.bzl", "load_wpiformat_rule_dependencies")

load_wpiformat_rule_dependencies()

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
