# Funkcionální programování
Zde budu nahrávat soubory ze cvičení a přednášek pro lepší orientaci
## Pracovní prostředí
### Instalace prostředí
Pro práci s Haskellovými soubory (.hs) používáme prostředí GHCi, které můžeme získat například z této [stránky](https://www.haskell.org/platform/).
### Základní příkazy
Mezi základní příkazy patří:
* **ghci** - spustí interpret GHC.
* **:l (:load)** - slouží k nahrání souboru s funkcemi.
* **:r (:reload)** - slouží k obnovení souboru s funkcemi.
* **GHC "soubor"** - používá se v adresáři a požaduje zadání parametru (názvu souboru), ze kterého potom vytvoří spustitelný .exe soubor. 
* **:t (:type)** - vrátí informace o typech výrazů nebo fukcí.
* **:set +t** - Interpret bude standartně vypisovat typ výrazu. Vypnutí pomocí příkazu **:unset +t**.

## Základní datové typy

### Int
* Celé čísla
* Operátory: +, -, *, ^, div, mod, abs, negate, ==
### Char
* Znaky
* Speciální znaky: '\t', '\n', '\\','\'', '\"'
* Základní funkce: 
  * ord :: Char -> Int: vrací pořádí znaku v ASCII tabulce.
  * chr :: Int -> Char: převede hodnotu z ASCII tabulky na znak.
  * toUpper: převede malé písmeno na velké písmeno.
  * isDigit: určí zda znak představuje číslo.
### Bool
* True / False
* Operátory: &&, ||, not, ==
### Double
* Reálná čísla
* Operátory: +, -, *, /, ^, **, ==, /=, <, >, <=, >=
### String
* Řetězec / Pole znaků
* Definice: type String = [Char]

## Funkce
### Definice funkce a jejího typu
**Definice:**
```haskell
name :: Type
name parameters = expression
```
**Příklad:**
powerToN udává název funkce, poslední datový typ uvedený za názvem funkce vždy uvádí návratový typ a typy před ním udávají, jakého datového typu funkce očekává parametry.
```haskell
powerToN :: Int -> Int -> Int
powerToN x n = x ^ n
```
### Syntaxe definice funkce 
* **Pattern matching (Porovnání vzorců):**
  * Když definujeme funkci můžeme zároveň zvlášť definovat těla funkce pro různé vzorce.
  * **Jednoduchý příklad:**
    * Jak je vidět definujeme funkci, která má jako parametr integer a jako návratovou hodnotu.
    * Funkce spočívá v tom, že při volání hádáme číslo typu INT, pokud tipneme správné číslo (tedy 7), funkce hned u prvního vzorce vypíše hlášku pro uhodnutí čísla. Pokud by jsme ale hádali jakékoliv jiné číslo, nebude splněna podmínka u prvního vzorce a funkce přejde na další. Pro jakékoliv jiné číslo (tedy x) vypíše hlášku pro neuhodnutí čísla. 
    * ```haskell
      zkusStesti :: Int -> String  
      zkusStesti 7 = "Mas stesti, hádal jsi správné číslo!"  
      zkusStesti x = "Bohužel, hádal jsi špatné číslo..."  
      ```
  * **Praktický příklad (factorial):**
    * Definujeme si funkci pro výpočet faktoriálu. Je jasné, že pokud budeme chtít vypočítat faktorial nuly, bude výsledek jedna. Zavedeme proto první vzorec, který urychlí práci s funkcí - ta nebude muset zbytečně vypočítávat výsledek a rovnou vrátí 1. Pokud zadáme jakékoliv jiné čislo n, funkce vrátí výsledek faktoriálu.
    * ```haskell
      factorial :: Int -> Int
      factorial 0 = 1
      factorial n = n * factorial (n-1)
      ```
### Deleni INT funkci
Pri deleni hodnot navrácených z integerovských funkcí je třeba dát si pozor. Haskell totiž neumožnuje dělit tyto funkce pomocí **/**, ale je třeba použít **div**.
Příklad:
```haskell
-- Funkce pro výpočet faktoriálu. Bude využita ve funkci pro výpočet variací k-tic z n prvků
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

-- Funkce pro výpočet variací k-tic z n prvků. Využívá funkce factrial.
variations :: Int -> Int -> Int
variations k n = (factorial n) `div` (factorial (n-k))
```
Pro více informací: [Why it is impossible to divide Integer number in Haskell?](https://stackoverflow.com/questions/35950600/why-it-is-impossible-to-divide-integer-number-in-haskell)
