# materialdesignlogo

A Flutter Package for creating cool & simple Logos.

## Table of contents

- [Project objectives](#Project-objectives)
- [Installation](#Installation)
- [Usage](#Usage)
     - [TextLogo](#TextLogo)
         - [`Plain Text Logo`](#Plain-Text-Logo)
         - [`Rich Text Logo`](#Rich-Text-Logo)
    - [Shaped Logo](#Shapes-Logo)
           - [`Supported Shapes`](#Supported-Shapes)
           - [`Shaped TextLogo`](#Shaped-TextLogo)
           - [`Single ShapedText Logo`](#Single-ShapedText-Logo)
           - [`multi Shaped Logo`](#Multi-Shaped-Logo)
           - [`Shaped IconLogo`](#Shaped-IconLogo)
           - [`Shaped Widget Logo`](#Shaped-WidgetLogo)
     - [`Double Logo`](#Double-Logo)
     - [`Labeled Logo`](#Label-Logo)
     - [`Wrap Logos`](#Wrap-Logos)
    - [Support](#Support)



## Project objectives
This Flutter-package was initiated to create different company logo  (e.g facebook, twitter,Google etc. ) and also
define an easy interface you can use to easily create your simple custom Logo.

## Installation
### pubspec
```dart
materialdesignlogo: <latest_version>
```

### Import it
```dart
import 'package:materialdesignlogo/materialdesignlogo.dart';
```


## Usage
materialdesignlogo package supported different 5 types of Logos namely TextLogo,Shaped TextLogo,Shaped IconLogo,Shaped WidgetLogo and Combined Logo.

## TextLogo
### `Plain Text Logo`
Most of the common, simple and elegant logos like facebook and Linkedln were created with ordinary Text with uniform TextSizes,Fonts,Colors,FontWeight and letterSpacing.
so, let's look at facebook Text Logo design.  
Let's use a predefined named constructor in MdiLogo class called MdiLogo.plainText, this constructor
just behave like normal Text() widget, but have all the style properties of text exposed inside it constructor.
```dart
static MdiLogo  facebookLogo(){
    return MdiLogo.plainText(
       fontSize: 50,
       fontColor: Colors.blue[500],
       text: 'facebook',
       letterSpacing: -1.2,
     )
 }
```
You can now add the facebook logo in your widget Tree :
```dart
Scaffold(
   appBar: AppBar(title:facebookLogo()),
   ...
);
```
Note: You don't need to redesign this logo because its a predefined static logo function of type Widget you can re-use from MdiLogo class with just a single line of code:
```dart
MdiLogo.facebook(plainLogo:true);
```
You can add the predefined facebook logo in your widget Tree  like this :
```dart
Scaffold(
   appBar: AppBar(title:MdiLogo.facebook(plainLogo: true)),
   ...
);
```
### `Rich Text Logo`
Most of the common, simple and more elegant logos like Google logo were created with ordinary Text, but with varying TextSizes,Fonts,Colors,FontWeight and letterSpacing.
so, let's look at Google Logo design
Let's use a predefined named constructor of MdiLogo class called MdiLogo.richTextLogo(), this behaves as
normal Text.rich() constructor of flutter Text() widget,but this function help you define varying properties (e.g colors,fonts...)
in a very intuitive and simple way unlike nested TextSpans widget in Text.rich. let's see how we use it in designing Google Logo.
```dart
static Widget  googleLogo(){
  String text='Google';
  var lastIndex = text.length - 1;
  return MdiLogo.richTextLogo(
      text: text,
      letterSpacing:  -4,
      fontColor: {
            [0,3]: Colors.blueAccent,
            1: Colors.red,
            2: Colors.yellow,
            4: Colors.green,
            lastIndex: Colors.red,
          },
      fontFamily: ~'JosefinSans',
      package: ~'materialdesignlogo',
      fontWeight: {0: FontWeight.w400, 1.to(lastIndex): FontWeight.w500},
      fontSize: {0: 86, 1.to(lastIndex): 72.0},
    );
}
```
How this works:  
MdiLogo.richTextLogo has all the parameter of Text() widget constructors and all the parameter of it style,  
but this parameters are maps, each map entry is identified with either index of each letter in the text or the text itself
for example to define the size of each letter inside the logo you need to declear it like this:
```dart
fontSize: {0: 86, 1.to(lastIndex): 72.0},
```
to() function is an extension function on int type defined in materialdesignlogo package.
 ```dart
 {1.to(5):72.0} //will assign the value of 72 to all the letters within the range of 1 to 5.
```

```dart
{0:86} //assigns the fontSize 86 to the first letter of the text which is 'G'.  
```
The symbol '~' is an extension unary operator on any type 'T' defined in materialdesignlogo package.
```dart
fontFamily: ~'JosefinSans', // assigns the fontFamily JosefinSans to all letters of the text.
package: ~'materialdesignlogo', // the package to load the font from is materialdesignlogo

```
```dart
fontColor: {
  [0,3]: Colors.blueAccent // Assign the value Colors.blueAccent to letters of index 0 and 3 in the text. 
}
```
```dart
fontColor: {
  'Goo': Colors.blueAccent // Assign the value Colors.blueAccent to letter G and o of the text. 
}
```
You can add the Google logo in your widget Tree :
```dart
Scaffold(
   appBar: AppBar(title:googleLogo()),
   ...
);

```
Note: You don't need to redesign this logo because its a predefined static logo function of type Widget you can re-use from MdiLogo class with just a single line of code:
```dart
MdiLogo.google()
```
You can add the predefined Google logo in your widget Tree like this instead :
```dart
Scaffold(
   appBar: AppBar(title:MdiLogo.google()),
   ...
);
```

## Shaped Logo

### `Supported Shapes`
materialdesignlogo package support 4 shape type for Shaped Logo defined as enum
in materialdesignlogo file:
```dart
enum LogoShape {
  bevelRectangle,
  regularRectangle,
  roundedRectangle,
  circle,
}
```
### `Shaped TextLogo`
#### `Single ShapedText Logo`
While there are so many Logos designed with plain Text, there are more elegant Logos designed with some Text and Shaped with a roundedRectangle or circle  
other shape,  
let's see an example of Linkedln Shaped Logo.
Let's use a named constructor MdiLogo.shapedTextLogo() of the MdiLogo class:
```dart
static MdiLogo linkedln(){
  return MdiLogo.shapedTextLogo(
              text: 'in'
              fontColor: Colors.white ,
              logoShape: LogoShape.roundedRectangle, 
              borderColor: Colors.white,
              borderWidth: 2,
              shapeColor: Colors.blue,
            );
}
```
Note: You don't need to redesign this logo because its a predefined static logo function of type Widget you can re-use from MdiLogo class with just a single line of code:
```dart
MdiLogo.linkedln()
```
#### `Multi Shaped Logo`
There are also some other variety of logos that use multiple shaped Text, for example
let's see how we can design BBC logo:
To easily design this logo you can use the named constructor of MdiLogo class named
MdiLogo.multiShapedTextLogo()
```dart
static Widget bbcLogo(){
return MdiLogo.multiShapedTextLogo(
     text: text??"BBC",
     fontSize:fontSize??~34.0, //define fontSize 34 for all texts
     fontColor:~Colors.white, //define Colors.white for all texts
    shapeColor: ~Colors.black, //define Colors.black for all shapes
  );
}
```
Note: BBC Logo is a predefined logo, you can re-use it or customize it by calling MdiLogo.bbc().
```dart
MdiLogo.bbc(fontColor:Colors.blue),
```

### `Shaped IconLogo`
Another supported type of logo is IconLogo,
For example let's design twitter logo using MdiLogo.shapedIconLogo() constructor:
```dart
 static MdiLogo twitterLogo() =>
      MdiLogo.shapedIconLogo(
          borderWidth: 2,
          logoShape: LogoShape.roundedRectangle,
          icon: MdiIcons.twitter,
          iconColor: Colors.white,
          shapeColor: Colors.blueAccent,
          );
```
In the above examples we make use of MdiIcons package which have abundant icons you can Use to
build your ShapedIconLogo.

Note: twitter Logo is a predefined logo, you can re-use it or customize it by calling MdiLogo.twitter().
```dart
MdiLogo.twitter(logoShape: LogoShape.circle),
```


### `Shaped WidgetLogo`
If your logo isn't text or icon type, you can define your own widget and pass ir to MdiLogo.shapeWidget()
as below:
```dart
static Widget shapedGoogleLogo()=>
        MdiLogo.shapedWidget(
          width: 130,
          shapeColor: Colors.white,
          widget: MdiLogo.google(), // this is a predefined Google logo in MdiLogo class
          shapeRadius: BorderRadius.circular(10),
          borderWidth: 2,
          logoShape: LogoShape.roundedRectangle,
        ),
```
MdiLogo.google() is a plain Rich text logo, but when passed to shapeWidget, we can give it a shape,  
and other properties.


### `Double Logo`
There are other special scenario where you will have to combine 2 different type of logos.
In that case you can use the named constructor  MdiLogo.doubleLogo() of the MdiLogo class.
For example let's create instagram logo by combining instagram icon logo and instagram text logo.
This will create an instagram logo containing 2 logo type, where the iconLogo is the first
at the left hand side and plainText logo (containing instagram text) following it.
The logo is defined as below:

```dart
 static Widget instagramCombine() =>
      MdiLogo.doubleLogo(
        gap: 2, // the gap between the two logos
        leadGravity: LeadGravity.start, // place the lead at the beginning(instagram icon logo in this case)
        content: 
            MdiLogo.plainText(//use plainText as the main content
              fontColor: Colors.black,
              fontWeight: FontWeight.w200,
              fontSize: 43,
              fontFamily: 'Billabong',
              package: ~'materialdesignlogo',
              fontStyle: FontStyle.normal,
              text: "Instagram",
              textShadows: ShadowAsset.singleShadow(),
              textAlign: TextAlign.center,
            ).padOnly(top: 18),
        lead:  MdiLogo.shapedIconLogo( // use shapedIconLogo with instagram icon as the first logo
          icon: MdiIcons.instagram,
          shapeColor: Colors.pinkAccent), 
      );
```


### `Labeled Logo`
A common variant of Doubled Logo, where you have a Label for a Logo
```dart
 static Widget facebookLabeled() =>
               MdiLogo.labeledLogo(
                 MdiLogo.facebook(),
                 logoLabel: 'facebook',
                 size: 70,
                 logoGravity: LeadGravity.top,
                 labelData: PlainTextLogo(fontColor: Colors.red),
               );
```

### WrapLogos
This will wrap any logo type supported by materialdesignlogo Package in
 a single widget, it will wrap each items in a shape specified in [shape] properties,
 even if the item  is of type Text.
 Useful for creating group of Social media logos for sharing contents
 Note: Only MdiLogo widget is supported.
 see the example below:
 ```dart
 static Widget shareButtons() =>
    MdiLogo.wrapLogos(
      logos: [
        MdiLogo.plainLogo(text:'Welcome',letterSpacing:-1.1),
        MdiLogo.linkedln(),
        MdiLogo.facebook(),
        MdiLogo.twitter(),
        MdiLogo.instagram(),
        MdiLogo.safari(),
        MdiLogo.google(),
        MdiLogo.facebook(plainLogo: true),
      ],
      size: 33,
      shapeRadius: BorderRadius.circular(12),
    );
 ```
 let's create another example to wrap labeledLogo and pass it to a dialog
like a normal Dialog for sharing content to other Apps on your device  we have shaped ,
 at the top and label at the bottom:

 ```dartCHANGELOG.md
 static Widget showShareDialog(BuildContext context) {
  showDialog(
              context: context,
              builder: (c) {
                return AlertDialog(
                    title: MdiLogo.wrapLogos(
                  logos: [
                        MdiLogo.labeledLogo(
                          MdiLogo.facebook(),
                          logoLabel: 'facebook',
                        ),
                        MdiLogo.labeledLogo(MdiLogo.instagram(),
                            logoLabel: 'instagram'),
                        MdiLogo.labeledLogo(MdiLogo.apple(),
                            logoLabel: 'apple'),
                        MdiLogo.labeledLogo(MdiLogo.twitter(),
                            logoLabel: 'twitter'),
                        MdiLogo.labeledLogo(MdiLogo.safari(),
                            logoLabel: 'Safari'),
                      ],
                  size: 65,// size of each item
                  labelLogoGravity: LeadGravity.top, // place the logo at top and label at bottom
                ));
              });
}
 
```

### `Support`
