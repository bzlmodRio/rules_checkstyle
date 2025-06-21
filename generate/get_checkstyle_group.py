from bazelrio_gentool.generate_styleguide_rule import StyleguideGroup


def get_checkstyle_group():
    version = "10.12.2"
    patch = ".bcr1"

    group = StyleguideGroup(
        short_name="checkstyle",
        is_java=True,
        repo_name="rules_checkstyle",
        version=version,
        year=1,
        maven_url="",
        patch = patch,
    )

    group.create_java_dependency(
        name="Placeholder",
        group_id="Placeholder",
        parent_folder="Placeholder",
        maven_deps=[("com.puppycrawl.tools:checkstyle", version)],
    )
    return group
