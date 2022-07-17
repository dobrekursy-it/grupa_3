Feature: Kolko i krzyzyk
  Scenario: Gracz zaznacza kolko
    Given gracz uruchomil gre
    When gracz kilka w "srodkowy" "srodkowy" kafelek
    Then kafalek "srodkowy" "srodkowy" jest "kolkiem"

  Scenario: Gracz zaznacza krzyzyk
    Given gracz uruchomil gre
    When gracz kilka w "srodkowy" "srodkowy" kafelek
    When gracz kilka w "prawy" "dolny" kafelek
    Then kafalek "prawy" "dolny" jest "krzyzykiem"
