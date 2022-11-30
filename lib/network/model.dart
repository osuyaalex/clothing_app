class Product {
  List<Navigation>? navigation;

  Product({this.navigation});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['navigation'] != null) {
      navigation = <Navigation>[];
      json['navigation'].forEach((v) {
        navigation!.add(new Navigation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.navigation != null) {
      data['navigation'] = this.navigation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Navigation {
  String? id;
  String? alias;
  String? type;
  List<Null>? channelExclusions;
  int? webLargePriority;
  Content? content;
  Null? display;
  Style? style;
  Link? link;
  List<Children>? children;

  Navigation(
      {this.id,
        this.alias,
        this.type,
        this.channelExclusions,
        this.webLargePriority,
        this.content,
        this.display,
        this.style,
        this.link,
        this.children});

  Navigation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alias = json['alias'];
    type = json['type'];
    if (json['channelExclusions'] != null) {
      channelExclusions = <Null>[];
      json['channelExclusions'].forEach((v) {
        channelExclusions!.add(null);
      });
    }
    webLargePriority = json['webLargePriority'];
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    display = json['display'];
    style = json['style'] != null ? new Style.fromJson(json['style']) : null;
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['alias'] = this.alias;
    data['type'] = this.type;
    if (this.channelExclusions != null) {
      data['channelExclusions'] =
          channelExclusions!.map((v) => v).toList();              //iiiiiuiuhjjjjjjjjjjjjjjjjjjjj
    }
    data['webLargePriority'] = this.webLargePriority;
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    data['display'] = this.display;
    if (this.style != null) {
      data['style'] = this.style!.toJson();
    }
    if (this.link != null) {
      data['link'] = this.link!.toJson();
    }
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? title;
  String? subTitle;
  String? webLargeImageUrl;
  String? mobileImageUrl;

  Content(
      {this.title, this.subTitle, this.webLargeImageUrl, this.mobileImageUrl});

  Content.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subTitle'];
    webLargeImageUrl = json['webLargeImageUrl'];
    mobileImageUrl = json['mobileImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['webLargeImageUrl'] = this.webLargeImageUrl;
    data['mobileImageUrl'] = this.mobileImageUrl;
    return data;
  }
}

class Style {
  String? webLargeStyleType;
  String? mobileStyleType;

  Style({this.webLargeStyleType, this.mobileStyleType});

  Style.fromJson(Map<String, dynamic> json) {
    webLargeStyleType = json['webLargeStyleType'];
    mobileStyleType = json['mobileStyleType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['webLargeStyleType'] = this.webLargeStyleType;
    data['mobileStyleType'] = this.mobileStyleType;
    return data;
  }
}

class Link {
  String? linkType;
  Null? brandSectionAlias;
  Null? categoryId;
  String? webUrl;
  Null? appUrl;

  Link(
      {this.linkType,
        this.brandSectionAlias,
        this.categoryId,
        this.webUrl,
        this.appUrl});

  Link.fromJson(Map<String, dynamic> json) {
    linkType = json['linkType'];
    brandSectionAlias = json['brandSectionAlias'];
    categoryId = json['categoryId'];
    webUrl = json['webUrl'];
    appUrl = json['appUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkType'] = this.linkType;
    data['brandSectionAlias'] = this.brandSectionAlias;
    data['categoryId'] = this.categoryId;
    data['webUrl'] = this.webUrl;
    data['appUrl'] = this.appUrl;
    return data;
  }
}

class Children {
  String? id;
  String? alias;
  String? type;
  List<String>? channelExclusions;
  int? webLargePriority;
  Content? content;
  Display? display;
  Style? style;
  dynamic link;
  List<Children>? children;

  Children(
      {this.id,
        this.alias,
        this.type,
        this.channelExclusions,
        this.webLargePriority,
        this.content,
        this.display,
        this.style,
        this.link,
        this.children});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alias = json['alias'];
    type = json['type'];
    channelExclusions = json['channelExclusions'].cast<String>();
    webLargePriority = json['webLargePriority'];
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    display =
    json['display'] != null ? new Display.fromJson(json['display']) : null;
    style = json['style'] != null ? new Style.fromJson(json['style']) : null;
    link = json['link'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['alias'] = this.alias;
    data['type'] = this.type;
    data['channelExclusions'] = this.channelExclusions;
    data['webLargePriority'] = this.webLargePriority;
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    if (this.display != null) {
      data['display'] = this.display!.toJson();
    }
    if (this.style != null) {
      data['style'] = this.style!.toJson();
    }
    data['link'] = this.link;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v).toList();
    }
    return data;
  }
}

class Display {
  int? webLargeTemplateId;
  String? webLargeTemplateName;
  int? webLargeColumnSpan;
  int? mobileTemplateId;
  String? mobileTemplateName;
  String? mobileDisplayLayout;

  Display(
      {this.webLargeTemplateId,
        this.webLargeTemplateName,
        this.webLargeColumnSpan,
        this.mobileTemplateId,
        this.mobileTemplateName,
        this.mobileDisplayLayout});

  Display.fromJson(Map<String, dynamic> json) {
    webLargeTemplateId = json['webLargeTemplateId'];
    webLargeTemplateName = json['webLargeTemplateName'];
    webLargeColumnSpan = json['webLargeColumnSpan'];
    mobileTemplateId = json['mobileTemplateId'];
    mobileTemplateName = json['mobileTemplateName'];
    mobileDisplayLayout = json['mobileDisplayLayout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['webLargeTemplateId'] = this.webLargeTemplateId;
    data['webLargeTemplateName'] = this.webLargeTemplateName;
    data['webLargeColumnSpan'] = this.webLargeColumnSpan;
    data['mobileTemplateId'] = this.mobileTemplateId;
    data['mobileTemplateName'] = this.mobileTemplateName;
    data['mobileDisplayLayout'] = this.mobileDisplayLayout;
    return data;
  }
}

class Hildren {
  String? id;
  String? alias;
  String? type;
  List<String>? channelExclusions;
  int? webLargePriority;
  Content? content;
  Null? display;
  Style? style;
  Link? link;
  List<Hildren>? children;

  Hildren(
      {this.id,
        this.alias,
        this.type,
        this.channelExclusions,
        this.webLargePriority,
        this.content,
        this.display,
        this.style,
        this.link,
        this.children});

  Hildren.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alias = json['alias'];
    type = json['type'];
    channelExclusions = json['channelExclusions'].cast<String>();
    webLargePriority = json['webLargePriority'];
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    display = json['display'];
    style = json['style'] != null ? new Style.fromJson(json['style']) : null;
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
    if (json['children'] != null) {
      children = <Hildren>[];
      json['children'].forEach((v) {
        children!.add(new Hildren.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['alias'] = this.alias;
    data['type'] = this.type;
    data['channelExclusions'] = this.channelExclusions;
    data['webLargePriority'] = this.webLargePriority;
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    data['display'] = this.display;
    if (this.style != null) {
      data['style'] = this.style!.toJson();
    }
    if (this.link != null) {
      data['link'] = this.link!.toJson();
    }
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ontent {
  String? title;
  String? subTitle;
  String? webLargeImageUrl;
  String? mobileImageUrl;

  Ontent(
      {this.title, this.subTitle, this.webLargeImageUrl, this.mobileImageUrl});

  Ontent.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subTitle'];
    webLargeImageUrl = json['webLargeImageUrl'];
    mobileImageUrl = json['mobileImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['webLargeImageUrl'] = this.webLargeImageUrl;
    data['mobileImageUrl'] = this.mobileImageUrl;
    return data;
  }
}

class Ink {
  String? linkType;
  String? brandSectionAlias;
  int? categoryId;
  String? webUrl;
  String? appUrl;

  Ink(
      {this.linkType,
        this.brandSectionAlias,
        this.categoryId,
        this.webUrl,
        this.appUrl});

  Ink.fromJson(Map<String, dynamic> json) {
    linkType = json['linkType'];
    brandSectionAlias = json['brandSectionAlias'];
    categoryId = json['categoryId'];
    webUrl = json['webUrl'];
    appUrl = json['appUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkType'] = this.linkType;
    data['brandSectionAlias'] = this.brandSectionAlias;
    data['categoryId'] = this.categoryId;
    data['webUrl'] = this.webUrl;
    data['appUrl'] = this.appUrl;
    return data;
  }
}

class Child {
  String? id;
  Null? alias;
  String? type;
  List<String>? channelExclusions;
  int? webLargePriority;
  Content? content;
  Display? display;
  Style? style;
  Null? link;
  List<Child>? children;

  Child(
      {this.id,
        this.alias,
        this.type,
        this.channelExclusions,
        this.webLargePriority,
        this.content,
        this.display,
        this.style,
        this.link,
        this.children});

  Child.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alias = json['alias'];
    type = json['type'];
    channelExclusions = json['channelExclusions'].cast<String>();
    webLargePriority = json['webLargePriority'];
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    display =
    json['display'] != null ? new Display.fromJson(json['display']) : null;
    style = json['style'] != null ? new Style.fromJson(json['style']) : null;
    link = json['link'];
    if (json['children'] != null) {
      children = <Child>[];
      json['children'].forEach((v) {
        children!.add(new Child.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['alias'] = this.alias;
    data['type'] = this.type;
    data['channelExclusions'] = this.channelExclusions;
    data['webLargePriority'] = this.webLargePriority;
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    if (this.display != null) {
      data['display'] = this.display!.toJson();
    }
    if (this.style != null) {
      data['style'] = this.style!.toJson();
    }
    data['link'] = this.link;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chil {
  String? id;
  String? alias;
  String? type;
  List<String>? channelExclusions;
  int? webLargePriority;
  Content? content;
  Null? display;
  Style? style;
  Link? link;
  List<Null>? children;

  Chil(
      {this.id,
        this.alias,
        this.type,
        this.channelExclusions,
        this.webLargePriority,
        this.content,
        this.display,
        this.style,
        this.link,
        this.children});

  Chil.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alias = json['alias'];
    type = json['type'];
    channelExclusions = json['channelExclusions'].cast<String>();
    webLargePriority = json['webLargePriority'];
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    display = json['display'];
    style = json['style'] != null ? new Style.fromJson(json['style']) : null;
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
    if (json['children'] != null) {
      children = <Null>[];
      json['children'].forEach((v) {
        children!.add(null);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['alias'] = this.alias;
    data['type'] = this.type;
    data['channelExclusions'] = this.channelExclusions;
    data['webLargePriority'] = this.webLargePriority;
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    data['display'] = this.display;
    if (this.style != null) {
      data['style'] = this.style!.toJson();
    }
    if (this.link != null) {
      data['link'] = this.link!.toJson();
    }
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v).toList();
    }
    return data;
  }
}
