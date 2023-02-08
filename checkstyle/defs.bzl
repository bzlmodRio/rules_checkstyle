def _impl(ctx):
    inputs = []
    outputs = []

    arguments = ctx.actions.args()

    # Sources
    inputs.extend(ctx.files.srcs)
    inputs.extend(ctx.files.config_file)

    property_file = ctx.actions.declare_file("{}_checkstyle_properties.properties".format(ctx.label.name))
    ctx.actions.write(property_file, "config_loc={}".format(ctx.files.config_file[0].dirname), is_executable = False)
    inputs.append(property_file)

    # Report
    report_file = ctx.actions.declare_file("{name}_checkstyle_report.{extension}".format(
        name = ctx.label.name,
        extension = "html",
    ))
    outputs.append(report_file)

    arguments = ctx.actions.args()
    arguments.add_all(["-c", ctx.files.config_file[0].path])
    arguments.add_all(["-p", property_file.path])
    arguments.add_all(["-o", report_file])
    arguments.add_all(ctx.files.srcs)

    # arguments.add("--help")

    # Run
    ctx.actions.run(
        mnemonic = "Checkstyle",
        executable = ctx.executable._executable,
        inputs = inputs,
        outputs = outputs,
        arguments = [arguments],
    )

    return [DefaultInfo(files = depset(outputs))]

checkstyle = rule(
    implementation = _impl,
    attrs = {
        "_executable": attr.label(
            default = "//checkstyle/wrapper",
            #default = "@rules_checkstyle_dependencies//:com_puppycrawl_tools_checkstyle",
            executable = True,
            cfg = "exec",
        ),
        "srcs": attr.label_list(
            allow_files = True,
            doc = "Source code files.",
            mandatory = True,
            allow_empty = False,
        ),
        "config_file": attr.label(
            allow_files = True,
            mandatory = True,
        ),
    },
    provides = [DefaultInfo],
)
