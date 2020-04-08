# memoryTheGame


## Spis treści:
1. [Wstęp](#wstęp)
2. [Instalacja](#instalacja)
3. [Działanie](#działanie)

* ## Wstęp

Był to jeden z moich pierwszych projektów które jakiś czas temu wykonałem w Swifcie.
Gra polega na odkryciu karty identycznej do znajdującej się na środku ekranu.

Tworząc ją uczyłem się możliwości jakimi dysponuje XCode i Swift. Aplikacja poprawnie wyświetla się na różnych urządzeniach (poniżej przedstawiony jeden z ekranów na Iphone 11 i 8. Istnieje również możliwość zapisania wyniku do bazy danych na podstawie Code Data. W wzorcu MVVM komunikacja z bazą danych następuje w modelu jednak chciałem sprawdzić w jaki sposób można wywoływać metody z AppDelegate i ostatecznie nie zastosowałem tutaj żadnego wzorca projektowego. Wygląd aplikacji został zaprojektowany w StoryBoardzie a okrągłe przyciski są wynikiem stworzenia nowej klasy dziedziczącej po UIButton dzięki czemu można podawać stopień ich zaokrąglenia. Została tu również zastosowana animacja w zamian za zegar pokazujący czas.

![gameScreen](/images/theGame.jpg) ![mainScreen11](/images/mainScreen11.jpg) ![mainScreen8](/images/mainScreen8.jpg)

* ## Instalacja

Do uruchomienia projektu wymagany jest macintosh z zainstalowanym programem XCode. W celu uruchomienia aplikacji należy wybrać opcję "Open another project..." a następnie znaleźć plik "memoryTheGame.xcodeproj". Po pomyślnym załadowaniu projektu najprostszą metodą jest użycie skrótu klawiszowego: "Command + R".

* ## Działanie

Grę rozpoczyna okrągły przycisk start. Karty na naszych oczach zostają trzy razy przemieszane a następnie zakrywane. Po wybraniu karty która okazała się złą rozpoczyna się odmierzanie czasu i przez dwie sekundy nie możemy wybrać żadnej innej karty. Zamiast zwykłego zegara zdecydowałem się zastosować animację która przez ten czas koloruje obramówkę przycisku na zmianę (raz na zielono raz na czarno). Ponadto żeby nie było za łatwo zarówno po błędnej odpowiedzi jak i co sekundę zwłoki naliczane są ujemne punkty.
