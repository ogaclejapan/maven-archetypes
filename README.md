Original Maven Archetypes
==========================

* [com.ogaclejapan:java-archetype-quickstart:1.0.0](#java-archetype-quickstart)
* [com.ogaclejapan:java-archetype-web:1.0.0](#java-archetype-web)

## Usage

> for Terminal

```bash
mvn archetype:generate -DarchetypeCatalog=http://ogaclejapan.github.com/maven-archetypes/archetype-catalog.xml
```

> for Eclipse

* Go to `Preferences > Maven > Archetypes` and `Add Remote Catalog`

```
Catalog File: `http://ogaclejapan.github.com/maven-archetypes/archetype-catalog.xml`   
Description: `ogaclejapan archetypes`
```

> for IntelliJ

* Go to `Create New Project > Java > Maven`
* Add a Check `Create from archetype`
* Select Button `Add Archetype...`

```
GroupId: com.ogaclejapan
ArtifactId: {{archetype}}  #e.g. java-archetype-web
Version: {{version}}       #e.g. 1.0.0
Repository: http://ogaclejapan.github.com/maven-archetypes/archetype-catalog.xml
```

## Archetypes

> java-archetype-quickstart

_This archetype generates a stand alone application project in Java._

Based on:
* JDK8


> java-archetype-web 

_This archetype generates a web application project in Java._

Based on:
* JDK7
* Servlet 3.0
* Spring MVC 4.0.2 + Freemarker
* Bootstrap 3
* Grunt (Build for css, js)


See http://ogaclejapan.github.com/maven-archetypes/archetype-catalog.xml

