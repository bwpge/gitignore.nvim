local M = {}

local ignores_file = vim.fs.joinpath(vim.fn.stdpath("data"), "gitignore_complete")

M.default_gitignores = {
    "AL",
    "Actionscript",
    "Ada",
    "AdventureGameStudio",
    "Agda",
    "Android",
    "Angular",
    "AppEngine",
    "AppceleratorTitanium",
    "ArchLinuxPackages",
    "Autotools",
    "Ballerina",
    "C++",
    "C",
    "CFWheels",
    "CMake",
    "CONTRIBUTING.md",
    "CUDA",
    "CakePHP",
    "ChefCookbook",
    "Clojure",
    "CodeIgniter",
    "CommonLisp",
    "Composer",
    "Concrete5",
    "Coq",
    "CraftCMS",
    "D",
    "DM",
    "Dart",
    "Delphi",
    "Dotnet",
    "Drupal",
    "EPiServer",
    "Eagle",
    "Elisp",
    "Elixir",
    "Elm",
    "Erlang",
    "ExpressionEngine",
    "ExtJs",
    "Fancy",
    "Finale",
    "Firebase",
    "FlaxEngine",
    "Flutter",
    "ForceDotCom",
    "Fortran",
    "FuelPHP",
    "GWT",
    "Gcov",
    "GitBook",
    "GitHubPages",
    "Gleam",
    "Go",
    "Godot",
    "Gradle",
    "Grails",
    "HIP",
    "Haskell",
    "Haxe",
    "IAR",
    "IGORPro",
    "Idris",
    "JBoss",
    "JENKINS_HOME",
    "Java",
    "Jekyll",
    "Joomla",
    "Julia",
    "Katalon",
    "KiCad",
    "Kohana",
    "Kotlin",
    "LICENSE",
    "LabVIEW",
    "LangChain",
    "Laravel",
    "Leiningen",
    "LemonStand",
    "Lilypond",
    "Lithium",
    "Lua",
    "Luau",
    "Magento",
    "Maven",
    "Mercury",
    "MetaProgrammingSystem",
    "ModelSim",
    "Modelica",
    "Nanoc",
    "Nestjs",
    "Nextjs",
    "Nim",
    "Nix",
    "Node",
    "OCaml",
    "Objective-C",
    "Opa",
    "OpenCart",
    "OracleForms",
    "Packer",
    "Perl",
    "Phalcon",
    "PlayFramework",
    "Plone",
    "Prestashop",
    "Processing",
    "PureScript",
    "Python",
    "Qooxdoo",
    "Qt",
    "R",
    "README.md",
    "ROS",
    "Racket",
    "Rails",
    "Raku",
    "ReScript",
    "RhodesRhomobile",
    "Ruby",
    "Rust",
    "SCons",
    "SSDT-sqlproj",
    "Salesforce",
    "Sass",
    "Scala",
    "Scheme",
    "Scrivener",
    "Sdcc",
    "SeamGen",
    "SketchUp",
    "Smalltalk",
    "Solidity-Remix",
    "Stella",
    "SugarCRM",
    "Swift",
    "Symfony",
    "SymphonyCMS",
    "TeX",
    "Terraform",
    "TestComplete",
    "Textpattern",
    "TurboGears2",
    "TwinCAT3",
    "Typo3",
    "Unity",
    "UnrealEngine",
    "VBA",
    "VVVV",
    "VisualStudio",
    "Waf",
    "WordPress",
    "Xojo",
    "Yeoman",
    "Yii",
    "ZendFramework",
    "Zephir",
    "Zig",
    "ecu.test",
    "Global/AL",
    "Global/Anjuta",
    "Global/Ansible",
    "Global/Archives",
    "Global/Backup",
    "Global/Bazaar",
    "Global/BricxCC",
    "Global/CVS",
    "Global/Calabash",
    "Global/Cloud9",
    "Global/CodeKit",
    "Global/Cursor",
    "Global/DartEditor",
    "Global/Diff",
    "Global/Dreamweaver",
    "Global/Dropbox",
    "Global/Eclipse",
    "Global/EiffelStudio",
    "Global/Emacs",
    "Global/Ensime",
    "Global/Espresso",
    "Global/FlexBuilder",
    "Global/GPG",
    "Global/Images",
    "Global/JDeveloper",
    "Global/JEnv",
    "Global/JetBrains",
    "Global/KDevelop4",
    "Global/Kate",
    "Global/Lazarus",
    "Global/Lefthook",
    "Global/LibreOffice",
    "Global/Linux",
    "Global/LyX",
    "Global/MATLAB",
    "Global/Mercurial",
    "Global/Metals",
    "Global/MicrosoftOffice",
    "Global/Momentics",
    "Global/MonoDevelop",
    "Global/NetBeans",
    "Global/Ninja",
    "Global/NotepadPP",
    "Global/Octave",
    "Global/Otto",
    "Global/PSoCCreator",
    "Global/Patch",
    "Global/PlatformIO",
    "Global/PuTTY",
    "Global/README.md",
    "Global/Redcar",
    "Global/Redis",
    "Global/SBT",
    "Global/STM32CubeIDE",
    "Global/SVN",
    "Global/SlickEdit",
    "Global/Stata",
    "Global/SublimeText",
    "Global/Syncthing",
    "Global/SynopsysVCS",
    "Global/Tags",
    "Global/TextMate",
    "Global/TortoiseGit",
    "Global/Vagrant",
    "Global/Vim",
    "Global/VirtualEnv",
    "Global/Virtuoso",
    "Global/VisualStudioCode",
    "Global/WebMethods",
    "Global/Windows",
    "Global/Xcode",
    "Global/XilinxISE",
    "Global/macOS",
    "Global/mise",
    "community/Alteryx",
    "community/AltiumDesigner",
    "community/AutoIt",
    "community/AutomationStudio",
    "community/B4X",
    "community/Bazel",
    "community/Beef",
    "community/Dotter",
    "community/Exercism",
    "community/Gretl",
    "community/Hexo",
    "community/LensStudio",
    "community/Logtalk",
    "community/MetaTrader5",
    "community/Move",
    "community/NasaSpecsIntact",
    "community/OpenSSL",
    "community/OpenTofu",
    "community/Puppet",
    "community/ROS2",
    "community/Racket",
    "community/Red",
    "community/SPFx",
    "community/Splunk",
    "community/Strapi",
    "community/Terragrunt",
    "community/Toit",
    "community/UTAU",
    "community/UiPath",
    "community/V",
    "community/Xilinx",
    "community/libogc",
    "community/AWS/CDK",
    "community/AWS/SAM",
    "community/BoxLang/ColdBox",
    "community/CFML/ColdBox",
    "community/DotNet/InforCMS",
    "community/DotNet/Kentico",
    "community/DotNet/Umbraco",
    "community/DotNet/core",
    "community/Elixir/Phoenix",
    "community/GNOME/GNOMEShellExtension",
    "community/Golang/Go.AllowList",
    "community/Golang/Hugo",
    "community/Java/JBoss4",
    "community/Java/JBoss6",
    "community/JavaScript/Cordova",
    "community/JavaScript/Expo",
    "community/JavaScript/Meteor",
    "community/JavaScript/NWjs",
    "community/JavaScript/Vue",
    "community/Linux/Snap",
    "community/Obsidian/NotesAndCoreConfiguration",
    "community/Obsidian/NotesAndExtendedConfiguration",
    "community/Obsidian/NotesOnly",
    "community/PHP/Bitrix",
    "community/PHP/CodeSniffer",
    "community/PHP/Drupal7",
    "community/PHP/Jigsaw",
    "community/PHP/Magento1",
    "community/PHP/Magento2",
    "community/PHP/Pimcore",
    "community/PHP/ThinkPHP",
    "community/Python/JupyterNotebooks",
    "community/Python/Nikola",
    "community/embedded/AtmelStudio",
    "community/embedded/IAR_EWARM",
    "community/embedded/esp-idf",
    "community/embedded/uVision",
    "build",
}

M.gitignores = {}

local function _log(level, s, ...)
    local msg = string.format(s, ...)
    vim.notify(msg, level, { title = "gitignore.nvim" })
end

function M.info(s, ...)
    _log(vim.log.levels.INFO, s, ...)
end

function M.err(s, ...)
    _log(vim.log.levels.ERROR, s, ...)
end

function M.write_file(path, data, mode)
    local f = io.open(path, mode or "wb")
    if f then
        f:write(data)
        f:close()
    else
        M.err("could not write to '%s'", path)
        return
    end
end

function M.load_ignores()
    M.gitignores = M.default_gitignores
    local f = io.open(ignores_file, "r")
    if not f then
        return
    end

    local items = {}
    local run = true
    while run do
        local line = f:read("*l")
        if not line then
            run = false
        elseif line ~= "" then
            table.insert(items, line)
        end
    end
    f:close()

    if not vim.islist(items) or #items == 0 then
        return
    end

    M.gitignores = items
end

local function get_ignores_api(path)
    M.info("Gitignore: indexing from github/gitignore")
    path = path or ""
    local files = {}
    local dirs = { path }

    while #dirs > 0 do
        local d = table.remove(dirs, 1)
        local url = "https://api.github.com/repos/github/gitignore/contents/" .. d

        local curr = d
        if d == "" then
            curr = "/"
        end
        M.info("Gitignore: fetching file list in '%s'", curr)

        local r = vim.system({ "curl", "-fsSL", url }, { text = true }):wait()

        local j = vim.json.decode(r.stdout or "")
        for _, item in ipairs(j) do
            if item.type == "file" and item.path:gmatch("gitignore$") then
                local f = item.path:gsub("%.gitignore$", "")
                table.insert(files, f)
            elseif item.type == "dir" and item.path:sub(1, 1) ~= "." then
                table.insert(dirs, item.path)
            end
        end
    end

    return files
end

function M.build(force)
    if not force and vim.fn.filereadable(ignores_file) == 1 then
        return
    end

    local items = get_ignores_api()
    if #items == 0 then
        M.gitignores = M.default_gitignores
        return
    end

    table.insert(items, "build")
    table.insert(items, "--path")
    M.gitignores = items
    local data = table.concat(items, "\n")
    M.write_file(ignores_file, data)
end

return M
