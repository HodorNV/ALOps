## December Update (CURRENT)

Welcome to another installment of our development updates. We have the pleasure of announcing the following great features.

### AL Formatter

The AL Language Visual Studio Code extension now offers users the option to automatically format their source code. The auto-formatter can be invoked to format an entire AL document or a pre-selected range.

In an existing project, open the document you want to format, right click - inside the document, and run "Format Document".

To format a range, in an already opened project, open the document you want to modify, select the specific range you want to format, right click it, and run "Format Selection" command.

![Formatter](https://docs.microsoft.com/en-us/dynamics-nav/developer/media/format-document.gif)

### Show My Code

The manifest has a new setting: Show My Code. It controls whether the source code is visible when other extensions debug it.

For example, an amazing library is developed and shared on AppSource for other people to use but the author doesn't want the users to see the code when they try to debug into it from their extension. The author will with the use of ShowMyCode make sure that the code is not shown when the user tries to debug into it. By default ShowMyCode is false but can be overriden in the app.json to true.

### Pages/reports show up in Search in the Web client

Each page and report has a new property called UsageCategory, which accepts the following values: None,Lists,Tasks,ReportsAndAnalysis,Documents,History,Administration. If this value is not set to none then the page/report will appear in Search.

There are two more properties added if the UsageCatgeory is set; ApplicationArea and AccessByPermission. These are used to control whether or not a page will appear, or if the page can be launched from Search.

Example:
```
page 70050088 SimpleCustomerCard
{
    PageType = Card;
    SourceTable = Customer;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.") {}
                field(Name;Name) {}
                field(Address;Address) {}
            }
        }
    }
}
```

### Generating symbols from C/SIDE and using them in VsCode.

In order to allow the server to accept symbols from C/SIDE you must enable the EnableSymbolLoadingAtServerStartup flag in the server's configuration file.

You can generate symbols from C/SIDE with the generatesymbolreference command. Example:
```
finsql.exe command=generatesymbolreference,database=<Dabasename>servername<server>,logfile=<path to log file>
```
This operation is lengthy. It should normally take a full application object compile time.

Once symbols are generated they can be downloaded from Visual Studio Code.

This new feature also allows that symbols changed in C/SIDE are immediately updated on the server. Therefore any change can be instantly downloaded with a new symbol download command from Visual Studio Code.

For this to happen you must start finsql with a special flag called generatesymbolreference.
Example:
```
finsql.exe generatesymbolreference=yes
```
If C/SIDE is started with this flag then a compilation of any application object would also update generate a new symbol reference for the changed application object.


## November Update (0.11.14434 - 2017/11/08)

Welcome to the November Update. We have several exiciting changes to announce.

### Multi-country extensions

It is no longer necessary to specify application locale in app.json. Your AL package will be compiled against the application that is present on the server that you connect to. This allows you to write a single AL extension for multiple country versions as long as you don't depend on country-specific code. If you do depend on country specific code you should only try to compile your app against a server set up for that country.

The application property in app.json has changed its format accordingly.

Old:
```
"application": {
    "version": "11.0.0.0",
    "locale": "US"
}
```
New:
```
"application": "11.0.0.0"
```
### Runtime packages

For On-Prem app distribution purposes it is now possible to generate "Runtime" packages that don't contain any AL code. Instead they contain the compiled output files that the server uses.

It first requires to have an extension developed and published to an on-premise instance. Then for generating the package, it connects to the server and finds the extension by the following powershell command:

```
Get-NavAppRuntimePackage
```

For publishing and installing the package the following powershell commands are used:

```
Publish-NavApp
Install-NavApp
```

This comes with the limitation that it only works for on-premise installations, the debugging experience is very limited since no source code is available and it can't be used for submissions to AppSource.


### Translations

We have now improved the translations feature with the support of Xliff files. To enable it open the app.json file and enter:

```
  "features": "TranslationFile"
```

Then invoke the package command (Ctrl + Shift + B) in Visual Studio code and there will be a directory "Translations" with the .xliff files ready to filled out with a new language.
The generated xliff file can be used within many of the free or commercial tools for translators.
All labels, label properties (Caption, Tooltip etc.) and report label will be included in the xliff file and be ready for translation.
After you have specified the target language and translated your labels, include the renamed xliff file in the Translations folder.
Make sure the name is not the same as the file which is being generated as it will be overwritten.
On next publishing of your extension the translations will be included in the package and picked up by the server.

Some things to note: ML properties, old report label syntax and TextConst do not get included in the xliff file and will not be translated. Make sure to update your code from the old ML syntax (=ENU='asd';DEU='qwe') to the new label syntax.

The label syntax is as follows (example for Caption property):
Caption = 'Developer translation for %1',  Comment = '%1 is extension name', locked = false, MaxLength=999;

The `comment`, `locked` and `maxLength` attributes are optional and the ordering is not enforced.
Use the same syntax for report labels

```
labels
{
    LabelName = 'Label Text', Comment='Foo', MaxLength=999, Locked=true;
}
```

And label data types:

```
var
    a : Label 'Label Text', Comment='Foo' MaxLength=999, Locked=true;
```

## October Update (0.10.13928 - 2017/10/12)

We are excited to announce the following changes in the October Update:

### Web client add-ins

It is now possible to develop JavaScript control add-ins in AL. The new AL type controladdin serves both as a replacement for the old XML manifest (https://msdn.microsoft.com/en-us/library/dn182591(v=nav.90).aspx) and as a replacement for the .NET interface as for bidirectional JavaScript-to-AL communication.
-  The JavaScript APIs remain the same as in Extensions V1: https://msdn.microsoft.com/en-us/library/dn182584(v=nav.90).aspx.
- There is no need for creating a DLL, signing it and creating a .zip file anymore. All development happens within the VS Code AL project and the control add-in gets deployed as part of the extension (Ctrl + F5).

A control add-in sample in 42 lines:
![ControlAddIn](https://msdnshared.blob.core.windows.net/media/2017/09/ControlAddIn.png)

### Dictionary and List
This update adds two new, highly requested AL types: List and Dictionary. For the first time in AL, you will be able to work with strongly typed lists and dictionaries.
At the moment, these types can only be used with simple types, for example, you can have a List of [Integer], but not a 'List of [Blob]'. The list of supported types is fairly long, but the main point is that: if you can use it as the return type of a procedure, you can use it in a list.
![DictionaryAndList](https://msdnshared.blob.core.windows.net/media/2017/09/DictionaryList.png)
![DictionaryAndList2](https://msdnshared.blob.core.windows.net/media/2017/09/DictionaryList_2.png)

### ForEach is back
We've added support for iterating over expressions of enumerable types in AL using the foreach statement. At the moment, you can use the foreach statement to iterate over expressions of type List, XmlNodeList, XmlAttributeCollection, and JsonArray.
![ForEach](https://msdnshared.blob.core.windows.net/media/2017/09/ForEach.png)

### New translation syntax
We have added support for the new Label syntax which will prepare you for using the new translation process which decouples translation from source code. You will be able to specify a default translation in code with some attributes and then in the next update we will provide you with generating a standard format translation file which is widely supported for translating. When you get your translation back, you simply package it with the extension and you now have a multilanguage extension!

We encourage you to start transitioning to this new syntax, so that youâ€™re ready when we update the compiler.
You cannot use Caption and CaptionML at the same time. This applies to the rest of the classic multilanguage properties.

The syntax is as follows:
![TranslationSyntax](https://msdnshared.blob.core.windows.net/media/2017/09/Translation1.png)

## September Update (0.9.12794 - 2017/09/07)

Welcome to the September update for the Developer Preview.

### We have a new developer preview image ready for you. To get up and running, follow these steps:
- Navigate to http://aka.ms/navdeveloperpreview to launch the September update of the Developer Preview.
- Specify Resource group, Vm Name, and Admin Password and then select which country version you want.
- When deployment has succeeded, you'll see following the landing page (Open the Virtual Machine DNS Name URL in a browser).
  ![VMLandingPage](https://msdnshared.blob.core.windows.net/media/2017/09/NewDevPreviewImage.jpg)
- You can connect to the Virtual Machine using Remote Desktop and Open VS Code to develop like before. Or, you can develop using VS Code on your local computer. To do this you must download the self-signed certificate and install it in the Local Machine Trusted Root Certification Authorities. Having downloaded and installed the certificate, you can download the AL Language Extension and install it into your local VS Code.
Use AL GO! and replace the corresponding lines in launch.json and app.json with the lines you see on the landing page. Download symbols, compile, deploy, and debug.

In addition to the next batch of [fixed issues](https://github.com/Microsoft/AL/milestone/9?closed=1) we announce the following changes:
- The .navx file extension for AL packages has been changed to .app
- The developer endpoint on the Dynamics NAV server now performs license checks when publishing AL projects. Developer Preview environments offer a free demo range of **50100-50149**. Dynamics 365 for Financials sandboxes have a more permissive license that lets you use range 50000-99999 as well as the 70000000-75000000 range.
- The developer endpoint on the Dynamics NAV server now performs permission checks to see if the user who is trying to publish an AL project has the rights to do so. The indirect insert permission into the Nav App table is validated. This permission is a part of the **"D365 EXTENSION MGT"** permission set.
- It is now possible to define Watches and conditional breakpoints in the new debugger. In the Activity Bar in Visual Studio Code, choose the Debugging icon to bring up the Debug view and add Watches. Use the Debug Menu to set breakpoints in the code.
![DebuggerWatch](https://msdnshared.blob.core.windows.net/media/2017/09/Watch-002.gif)

## August Update (0.8.11706 - 2017/08/16)

The Developer Preview August Update is now live! We're excited to announce the new features for this month as well as share our progress on [fixing the issues](https://github.com/Microsoft/AL/milestone/8?closed=1) reported by you.
Please keep the feedback coming, we really appreciate your engagement.

As usual, you can provision the latest environment at [https://aka.ms/navdeveloperpreview](https://aka.ms/navdeveloperpreview)

### This update brings the following changes:
-   In this update, based on your requests, you can work with three different country versions of the application database. This is provided through hosting them on the Dev Preview VM; each with their own NST. The services that are available and the names that you should use in serverInstance setting in launch.json file are the following: â€œUSâ€, â€œGBâ€, and â€œCAâ€. The US, GB, and CA versions correspond to the Dynamics 365 for Financials user experience and application database.
If you need to code against W1, you will have to enable the developer service endpoint in the Administration Console for the NAV serverInstance and use â€œNAVâ€ in the serverInstance setting in launch.json file. Note, that the NAV serverInstance is using UserPassword authentication and the other instances are using Windows Authentication.

-   We continue to add replacements for highly requested .NET types. This update adds a new AL type, TextBuilder, that wraps the most commonly used functionality of the System.StringBuilder type in the .NET Framework.

    ```
    procedure ConcatenateString()
    var builder : TextBuilder;
        textResult : Text;
    begin
        builder.AppendLine('We can append new lines');
        builder.Append('... or just characters to the current line');
        builder.Replace('Text can also be', 'replaced');
        textResult := builder.ToText();
    end;
    ```

- We've also enriched the built-in Text data type with a bunch of new functions - for a full list, see the [documentation](https://msdn.microsoft.com/en-us/dynamics-nav/developer/datatypes/devenv-text-data-type).

### Our VS Code extension comes with new capabilities again this time:
-   The popular "Go To Definition" for dependencies gives you a generated version of the application objects, such as which fields a table has, and the datatypes of the fields. Simply place your cursor on the type and press F12.
    ![GoToReferenceSymbols](https://msdnshared.blob.core.windows.net/media/2017/08/2017_Aug_GoToReference.gif)

-   We've added a preview of the new debugging experience.

    The semantics of pressing **F5** in the VSCode has changed - now it will start a debugging session. To start the client without debugging, use **Ctrl+F5**.
    To hit the breakpoints in the debugger, you just trigger the relevant actions in the web interface.
    ![Debugger](https://msdnshared.blob.core.windows.net/media/2017/08/2017_Aug_Debugging.gif)

-   New authentication methods are now available. The property `windowsAuthentication` in the launch.json file is deprecated, although it will still work.

    Instead, set the new `authentication` property to the following values:
    -   Windows
    -   UserPassword
    -   AAD


## July Update (0.7.11459 - 2017/07/12)

Welcome to the Developer Preview July Update! We're excited to announce the new features for this month as well as share our progress on [fixing the issues](https://github.com/Microsoft/AL/milestone/7?closed=1) reported by you.
Please keep the feedback coming, we really appreciate your engagement.

As usual, you can provision the latest environment at [https://aka.ms/navdeveloperpreview](https://aka.ms/navdeveloperpreview)

### This update brings the following changes:
-	We're addressing the most highly requested .NET replacement, namely XML handling. This update brings a set of new native AL types that let you create, read, update and output XML documents using the XML DOM model. The most important new types include:
    -	XmlDocument
    -	XmlElement
    -	XmlAttribute

    Documentation for these new types can be found [here](https://go.microsoft.com/fwlink/?linkid=851979).

-	Completing the functionality around tenant-specific profiles originally announced in June Update we now offer new AL object types Profile and Page Customization. These new objects let you define a set of pre-defined profiles and include them in your extension. Page Customization object is very similar to a Page Extension but more restricted. As of now Page Customization can only include moving of controls and actions as well as setting Visiblity to true/false. It cannot contain variables, functions or triggers.

-	Our VS Code extension now offers signature help for all syntax elements that have structured parameters, for example:
    ```
    field(Name;Expression)
    key(Name;Field1, Field2, Field3)
    ```

-	The RecordRef type has been reworked and made available for extension development. When used from extensions RecordRef.Open will only let you open records with Id less than 2 billion.

-	The Permission property has been reworked and made available for extension development. In the first iteration the property lets you only reference objects added within your own extension. However, this will be expanded in the future releases.


## June Update (0.5.10663 - 2017/06/20)

The June update for Developer Preview is now live! We've had a month with new features and a lot of time spent on improving quality, especially trying to iron out the bugs you have submitted to us via GitHUb. Here is a [full list of fixes](https://github.com/Microsoft/AL/milestone/6?closed=1). Thanks again to everyone who has contributed and, please keep that feedback coming.

### This month's update includes
- 	In the in-app designer you can now reposition or hide a Cue tile or Cue Group on any page by using the jewel menu.
![DesignerCue](https://msdnshared.blob.core.windows.net/media/2017/05/cue.gif)
-	We've focused on making the boundary between the in-app designer and Visual Studio Code smoother.
    -	Pressing F6 in Visual Studio Code will open the current extension and allow you to add more changes using the in-app designer. For example, start in VS Code, define a page extension, press F6 to open the web client, then use the in-app designer to move the fields around and finally save your extension to files.
    -	Pressing F7 in Visual Studio Code to pull changes made by the in-app designer and add them as code back into your source. For example, start in VS Code, write a page extension, press F6, and move fields. Then switch back to VS Code and press F7. The new field order will update in the source code.

-	Added fixes to the txt2al.exe converter utility. We now support .DELTA files conversion and the command line format has changed to:
```
Copyright (C) 2017 Copyright (c) Microsoft Corporation. All rights reserved.
-source=Path	Required. The path of the directory containing the TXT files.
-target=Path	Required. The path of the directory into which the converted AL files will be placed.
-rename	Rename the output files to prevent clashes with the source .txt files.
-type=ObjectType	The type of object to convert. Allowed values: Codeunit, Table, Page, Report, Query, XmlPort
-extensionStartId	The starting numeric ID of the extension objects (Default: 70000000). It will be incremented by 1 for each extension object.
-help	Display this help screen.
```

- You can now include translation files and table data files in Extensions V2. To include a language, include the TXT file in the project directory. Press F5 will generate a .navx package that includes the captions. Note, that you can export captions using the following cmdlet https://msdn.microsoft.com/en-us/dynamics-nav/microsoft.dynamics.nav.model.tools/export-navapplicationobjectlanguage. The same approach goes for data and you can use this cmdlet https://msdn.microsoft.com/en-us/dynamics-nav/microsoft.dynamics.nav.management/export-navdata to export your data to file and then include in the .navx package.
- 	Following a community suggestion from GitHub, IntelliSense has been improved to help writing pages faster (and other objects which have fields based on source tables)
 ![FieldRecommenders](https://msdnshared.blob.core.windows.net/media/2017/05/Code_2017-05-29_14-24-25-002.png)
When coding the page fields, use the snippet tfieldpage, then position your cursor as shown and invoke IntelliSense (Ctrl+Space) to choose which field to populate.

- Tenant-specific profiles

   With this update, we introduce the system capability to define tenant-specific profiles. This has been one of the most requested features by partners who create extensions. You'll be able to use full capability of this feature in upcoming developer preview when we deliver compiler support to define a new tenant-specific profile directly in AL code. This update delivers only the underlying platform capability enabling extensions to define profiles.

   As a consequence of adding this feature we expanded the UI around Profile creation and selection to differentiate system-wide profiles from tenant-specific profiles. Now the page which is listing profiles identifies profile scope which is either System or Tenant. Additionally, in case a profile is introduced when installing an extension, you'll be able to see the extension name on that list.
    ![Profiles](https://msdnshared.blob.core.windows.net/media/2017/05/profiles.jpg)
   The profile card has been changed in similar way. Now you must choose the scope of new profile depending on a need to create a profile which is common for all tenants or tenant-specific.

   *Note: in Dynamics 365 for Financials the System option isn't available â€“ a tenant administrator is not able to create System profiles, which would be shared with other tenants. The only option is to create a tenant-specific profile.*

   ![Profiles-Card](https://msdnshared.blob.core.windows.net/media/2017/05/profile-card.jpg)

   Stay tuned until the next update when you will be able to fully use this feature in your extensions.

- Other notable fixes:
    - Highly requested virtual tables are now available: User, Field, AllObj, AllObjWithCaption etc.
    - Powershell cmdlet support for exporting objects into new syntax.

## April Update (0.4.9209 - 2017/04/21)

Welcome to the April update for the Developer Preview. Again this month we've been working on a lot of exciting stuff. Check out the list of what's new below.
- GitHub reported issues fixed in this release: https://github.com/Microsoft/AL/milestone/5?closed=1
- Query and XmlPort objects have been added to the compiler.
- This update contains a conversion tool that allows you to take existing Dynamics NAV objects that have been exported in .txt format and convert them into the new .al format. It's a two-step process; firstly exporting the objects from C/SIDE in a cleaned format, and secondly converting them to the new syntax. Give it a try by following these steps:
Export the objects using the command line. The client GUI doesn't have the switch available, so you must use the command line, for example for table with ID 225:
   ```
   finsql.exe Command=ExportToNewSyntax, File=exportedObjects.txt, Database="Demo Database NAV (10-0)", ServerName=.\NAVDEMO ,Filter=Type=table;ID=225
   ```

   Run the txt2al.exe converter tool. The tool is located in the ..\Program Files (x86)\Microsoft Dynamics NAV\100\RoleTailored Client folder. Usage:
   ```
   txt2al <Source directory> <Destination directory> [-rename]
    -rename - Name the output files based on the object name.
   Important: The conversion tool should only be used for export. Importing objects that have been exported can damage your application!
   ```
- You can now embed Permission Sets, Tenant Web Service definitions, and Custom Report Layouts in Extensions V2. The process is similar to the one that you used for Extensions V1 and you can follow the existing documentation: https://msdn.microsoft.com/en-us/dynamics-nav/how-to-export-data-for-an-extension.
- AL:Go! startup is under development to start supporting the choice between online and local development. For now, just select the Local server option.
![AlGo](https://msdnshared.blob.core.windows.net/media/2017/04/algo_cloud.gif)
Typing Ctrl+Shift+P opens the command palette where you can execute the AL: Go! command. This will still prepare an empty project for you to start with and now includes a step for choosing if you're working locally or against a cloud instance.

   *Note: When you do an F5 deploy you may be asked to enter your Azure account. This is a bug and because we haven't been able to set 'local' for your debug environment. To set this yourself, select the debug button from the left-hand menu and pick the local in the drop-down list for the configuration.*

- In the Designer, drag and drop a page part to reposition it on the Role Center or FactBox pane. You can also hide an individual part. For now, the only way to make the hidden part visible again is to uninstall the extension or modify the extension using Visual Studio Code.
![DesignerDragParts](https://msdnshared.blob.core.windows.net/media/2017/04/designer_drag.gif)

- You can now reposition the Freeze Pane on any list page or part by using the jewel on the column header.
![DesignerFreezePane](https://msdnshared.blob.core.windows.net/media/2017/04/designer_freeze.gif)
- The new Query and XmlPorts objects have snippet support as well. Take a look at tquery and txmlport. Here is an example of an XmlPort object in the new syntax:
![XmlPortSyntax](https://msdnshared.blob.core.windows.net/media/2017/04/xmlport.png)

## March Update (0.2.8249 - 2017/03/28)

Welcome to the March update for the Developer Preview. We continue to fix bugs reported by you on our GitHub issues list [https://github.com/Microsoft/AL/milestone/3?closed=1] and made other improvements.
Here's what's new:
- We're making you more productive in the Designer! You can now reorder columns with a simple drag and drop, and you can hide or show columns. Try it out on any page with columns, such as worksheets, sales documents, or lists.
![DesignerAddColumn](https://msdnshared.blob.core.windows.net/media/2017/03/Add-a-column.gif)
- Report application objects join the list of supported objects! Create reports using new syntax and include them in your extensions.
Reports do support both Word and RDLC layout.
Layouts are now saved as external files. Save your layouts in a subdirectory of your VS Code project and then point to the file with the property wordlayout and rdlclayout.

   ![ReportLayout](https://msdnshared.blob.core.windows.net/media/2017/03/A0C4CB3F.png)

   *Note: At this time we have basic support for reports. Reports can be authored and they compile and run, but we're aware there are advanced scenarios that may not work. We're working hard to fix these and also encourage you to file issues you find to our GitHub project.*

   *Note: Report development does not include an integrated designer experience i.e., integration with Visual Studio for RDLC is missing but the Word editor will show fields in the XML Mapping from the Developer tab.*

   Sample code has been updated on the Azure VM to include Report 101 - Customer List.

- You may define a dependency on another extension by listing it in the app.json configuration file. Taking a dependency will allow you to code against objects including page extension object and table extension objects in that extension. Symbols from the extension will show up in IntelliSense.

## February Update (0.2.7308 - 2017/02/16)

Welcome to the February update for the Developer Preview.As in the last two updates, we've fixed bugs reported by you on our GitHub issues list (https://github.com/Microsoft/AL/milestone/2?closed=1) and made other improvements.

You can see a list of what's new below:
- Finishing your design work in the client now offers two options on saving, allowing you to save the changes to the tenant for all users, or to save the changes to a file that you can work on later in VS Code.Performance of the designer has improved and is snappier.
   ![DesignerFinishUp](https://msdnshared.blob.core.windows.net/media/2017/02/inclient_2.png)

- To guide users towards a better page design, we've been adding a few rules in the in-client designer. For example, you can only drop media fields onto card part pages. Also, you cannot drop a field under a repeater control, because this is not the design that list pages were intended for.

- Getting started in VS Code has been streamlined. Once you've installed the visx file, just enter AL: Go! in the command palette (Ctrl+Shift+P) and you'll be offered a new folder to build a solution in. The preset values are configured for your Azure Gallery instance and if you're missing the symbols for the project, VS Code will offer to download them for you. Note, we've introduced a shortcut for this too - Alt+A, Alt+L. Enjoy!
![AlGo](https://msdnshared.blob.core.windows.net/media/2017/02/algo.gif)

- We've made improvements in IntelliSense with contextual support for keywords in all objects - and we've added autocompletion and IntelliSense for setting values for the CalcFormula and TableRelation properties.
- You can now reference Query objects from the base application. This gives you the ability to declare variables of the type Query and call AL functions on them.
- References by symbols have been implemented meaning that you can find all references in an inline editor.Pressing Shift+F12 on top of a symbol will open a view that lets you jump to all instances of that symbol.Furthermore,selecting a symbol and pressing F2 allows you to rename all instances of that symbol. Note, that symbolic rename is cleverer than text matching and will only change the current symbol. For example, it will replace all instances of variable Foo, but not rename function Foo.
- Several AL variable types have been introduced mapping to the HTTP Client and JSON types. Using HttpClient, HttpResponseMessage, JsonObject, JsonToken, and JsonValue will allow you to access Azure functions and other Web services.

## January Update (0.2.6084 - 2017/01/14)

We've been bowled over by the positive comments from the community supporting this development effort. The team has read every suggestion, bug submitted, and idea and we're enthusiastic that you're so interested. That's why we're even happier to announce an update to the developer tools preview.

### The following is included in the update
- Fixed various bugs reported by the community in the in-client designer.
- You can now reference Report and XMLPort objects from the base application. This gives you the ability to use these objects in the RunObject property, as well as, declare variables of the types Report and XMLPort, and call AL functions on them.
- Improved IntelliSense for Pages and Tables. IntelliSense will offer keywords in Pages and Tables. The supported keywords will be offered in the correct context and are intended to help build the object correctly.
![KeywordsPage](https://msdnshared.blob.core.windows.net/media/2017/01/page_keywords.jpg)
![KeywordsPage2](https://msdnshared.blob.core.windows.net/media/2017/01/page_keywords_1.jpg)
![KeywordsTable](https://msdnshared.blob.core.windows.net/media/2017/01/table_keywords.jpg)
- IntelliSense for attributes. The list of available attributes will be displayed after typing '['. Each attribute will also include signature help showing the number and types of expected parameters. Also, IntelliSense for the EventSubscriber attribute offers lookup for the event name and the field/action name parameters which helps discover the available event publishers.
![IntellisenseAttributes](https://msdnshared.blob.core.windows.net/media/2017/01/event_subscriber.jpg)
- Fixed miscellaneous bugs reported to us. Issues submitted to the GitHub project issue list that have been fixed have been marked as included in the January update.
![BugListJanuary](https://msdnshared.blob.core.windows.net/media/2017/01/bugs_fixed1.jpg)

## December Preview Release (0.0.1 - 2016/12/20)

We're excited to introduce you to the new tools you'll use to build extensions and apps in and for Dynamics NAV. This December preview is meant as an appetizer and way for you to try out what we have so far. We've been looking forward to showing you what the new tools look like and let you take them for a spin.
The tools that you'll be using come in two flavors and both are available in preview from today.

### The in-client designer
![Designer](https://msdnshared.blob.core.windows.net/media/2016/12/Adding-a-field.gif)

Make an extension in the client itself. Business consultants and UX designers will love using this drag-and-drop interface. Rearrange fields, rename groups, and reposition elements to build a perfect extension to support an industry-specific solution or implement a business process optimization.

### Visual Studio Code
![VsCode](https://msdnshared.blob.core.windows.net/media/2016/12/vscode.png)

Use the AL Extension for NAV in Visual Studio Code to build powerful extensions based on tables, pages, and codeunits using the new objects: Page Extensions and Table Extensions. Follow this route to build rich extensions that reuse and extend core business logic in your application.

### I'm keen! How do I get started?
Two steps to get set up and then you can put rubber to the road. First you need an Azure Subscription. If you don't have one, you can get a free 30-day trial from https://azure.microsoft.com/free/ that will give you access to everything you need. If you do take the trial, you will need to provide a telephone number and credit card, but these are for ensuring you're not a bot and you won't be charged.
Secondly, head over to http://aka.ms/navdeveloperpreview. Login to your Azure Subscription. Select your subscription, resource group, location, name, and a VM Admin Password. Leave the remaining fields as their defaults. Accept the terms, Pin to dashboard and select Purchase. The instance takes about 5 minutes to set up, and the VM will be ready about 15 minutes after Azure says Deployment Succeeded. So go get a coffee and come right back.

### How do I learn more?
Great question! We were hoping you'd ask that. Check out our docs:
- [Tools overview](https://go.microsoft.com/fwlink/?linkid=835954)
- [Getting Started guide](https://go.microsoft.com/fwlink/?linkid=835955)
- [Object overview and AL language changes](https://go.microsoft.com/fwlink/?linkid=835956)

### This is great - how do I share the love?
Are you as excited as we are? Then blog or tweet using the tags #dyndev365, #msdynnav, and #code. Collaborate with us by adding your product ideas. Do that in GitHub https://github.com/microsoft/al/issues.

### I found a bug - what do I do?
We're sorry - we're still in preview and still learning too. It would help us so much if you can track down the bug and tell us. During the preview, the best way to let us know is to file it as an issue in GitHub https://github.com/microsoft/al/issues. The sooner we know, the sooner we can patch it and get it back out there.

### New builds! Where do I get a new build?
While we're in preview we're going to be fixing as many of those bugs as we can and we'll be working on new features too. We'll update the image on Azure Gallery about every month and let you know here on the blog when we do. We're also working on a process to get them out faster but with Christmas and the New Year coming up, it might just take a bit longer the first time.
Another warning, when we do provide a new gallery image, we won't be able to provide any upgrade tools between the versions. We'll try our best to avoid breaking changes but there are no promises.