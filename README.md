# SalesmanCodingChallenge

Hallo und Danke schön für diese interessante Aufgabe! 

als erstes habe ich das Datenmodell "Salesman" implementiert inklusive aller notwendigen Methoden und Tests. 

"SalesmenStore" verwaltet eine Liste von Salesman und bietet eine Filtermethode zum Filtern der Liste. 

Die Postleitzahl habe ich nicht als separate Klasse oder Struktur angelegt.
Ich finde es simpler, einfach eine Methode zum Validieren (Ist "123*" ein valider PLZ-Ausdruck für 'areas' ?) und zum Matchen ("Matcht "123*" mit "12345" ? ) 

Es war mir nicht klar, ob im Eingabefeld auch der Sternchen-Platzhalter funktionieren soll, habe mich aber dagegen entschieden, da "123" ja im Prinzip denselben Effekt hat wie "123*", somit ist dort "*" überflüssig. Gibt man nun "123*" ein, erhält man eine leere Liste. 

Natürlich ist alles nach TDD entwickelt und somit gut getested :) 

Die App benutzt SwiftUI, besteht also aus einer ContentView und einem ViewModel (SalesmanListViewModel), welches das List-Processing übernimmt (Texteingaben+Update der Liste, Listenelement expandiert oder nicht).

Da SwiftUI noch relativ neu für mich ist, hat Google, StackOverflow und ChatGPT mir ein wenig hilfreich unter die Arme gegriffen :) 

der SalesmenStore wird in der SalesmanApp - struct initialisiert und dem ViewModel übergeben, welches an die ContentView übergeben wird (Dependency injection in der CompositionRoot). 
Somit war kein Singleton notwendig. 

Da nur das UI-Design für Android verfügbar war, habe ich mich soweit es ging und es SwiftUI erlaubte, daran gehalten. UI-Tests habe ich mir erspart, die dauern viel zu lange. Snapshot-Tests wären da geeigneter, das wäre noch drin gewesen, aber irgendwann muss ja mal Schluss sein ;)



Hier die Zusammenfassung der Code Review:

1. UI (OK)
2. Async Code Handling (TODO)
3. MVVM (TODO)
4. Business logic (OK)
5. Testing (OK)

-> Bestanden 
Und hier die detaillierte Code Review:

Gut:
- readme
- suchlogik ist gut bis auf sternchen in suchleiste nicht beachtet, aber auch in der readme erklärt
- debounce delay für die suche
- dependencies wurden im init reingegeben

Anmerkungen:
- keine animation
- ui nicht ganz so nach design
- viewmodel ist kein @MainActor
- formatting noch ok
- `filterItems` und `salesmenStore` könnten `private` sein
- würde sagen, dass die `createTestDataForPlaceholderTests` und `createTestData` funcs nicht in den `SalesmenStore` gehören
- keine views ausgelagert
- kein async await
- `Salesman` model ist eine class statt struct
- kein codable verwendet
- `SalesmenStore` hält die daten und auch die logik, statt service + repo
- kein `guard` verwendet
- tests sind ok (sternchen als sucheingabe nicht beachtet, manchmal sind mehrere testfälle in eine func)
- mal deutsche comments und variablen
 





