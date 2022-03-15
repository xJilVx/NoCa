;###############################################################LUCIUS
;#### HOPE YOU ENJOY THIS AS MUCH AS MY FRIENDS AND I DID ######LUCIUS
;###############################################################LUCIUS
on *:TEXT:!rpghelp:#: {
  tokenize 32 $strip($1-)
  if (!%replyflood. [ $+ [ $chan ] ]) {
    set -u4 %replyflood. [ $+ [ $chan ] ] ON 
    msg $chan 10Here is the list for the rpg and related commands like fighting.
    msg $chan 07!fight (nick) 10& 07 !fight evil(2,3,4,5,6,7,8,9,10,11,12) 10&07 !myfights 10....
    msg $chan 07!rpgshop 10&07 !restartRPG 10&07 !rpgstats 
    msg $chan 10.buy (nick) 10&07 .owns (nick) 10&07 .myslaves 10&07 .freeslave 
  }
}

;############################### LUCIUS
;######  RPG STATISTICS  ####### LUCIUS
;############################### LUCIUS
on *:TEXT:!restartrpg:#: {
  tokenize 32 $strip($1-)
  if ($readini(mnycount.ini,$nick,EXP) <= 32000) || (!$readini(mnycount.ini,$nick,EXP)) { msg $chan 10You cannot restart your game until you complete all of the levels. | HALT }

  if ($readini(mnycount.ini,$nick,EXP) > 32000) {
    if (!%confirmflood. [ $+ [ $nick ] ]) {
      notice $nick 10This will restart your RPG with 4ZERO10 experience but you will keep all equipment: weapon, armour, and of course 3Credit10 ring!  If you are 4very sure10 then repeat the command within 5 seconds.
      set -u6 %confirmflood. [ $+ [ $nick ] ] ON
      HALT
    }   
    if (%confirmflood. [ $+ [ $nick ] ]) {
      notice $nick 10As you wish7 $nick $+ 10. Your 4EXP10 has been reset to 4ONE10 and I have left all the goodies you picked up on the way.  Enjoy the easy money  ;]
      writeini -n mnycount.ini $nick EXP 1
      HALT
    }
  }
}
on *:TEXT:!rpgstats:#: {
  tokenize 32 $strip($1-)
  if (!%replyflood. [ $+ [ $chan ] ]) {
    set -u4 %replyflood. [ $+ [ $chan ] ] ON 
    if ($readini(mnycount.ini,$nick,rpgarmour)) {
      var %rpgwearing 10 You wear4:7 $readini(mnycount.ini,$nick,rpgarmour) Armour! 
    }
    if ($readini(mnycount.ini,$nick,rpgweapon)) {
      var %rpgkilling 10 Your weapon is4:7 $readini(mnycount.ini,$nick,rpgweapon) $+ ! 
    }
    if ($readini(mnycount.ini,$nick,rpgcharm)) {
      var %rpgluck 10 Your charm is4:7 Lucky Ring Of $readini(mnycount.ini,$nick,rpgcharm) $+ ! 
    }
    if (!$readini(mnycount.ini,$nick,EXP)) { 
      notice $nick 10You haven't played my 4RPG 10To begin your quest type4:7 !fight evil | HALT 
    }
    if ($readini(mnycount.ini,$nick,completed)) {
      var %compledgame 14(5Completed4 $readini(mnycount.ini,$nick,completed) 5Times!14)
    }

    var %currentrpgexp $readini(mnycount.ini,$nick,EXP) 
    if (%currentrpgexp < 220) { notice $nick 10You are LVL4:7 110 have had4:7 $readini(mnycount.ini,$nick,FightNumber) 10fights and need4:7 $calc(220 - %currentrpgexp) 4EXP10 to lvl up 14(Total EXP %currentrpgexp $+ )10. %rpgwearing %rpgkilling %rpgluck 10You Have7: $readini(mnycount.ini,$nick,money) 10Credits.14 To continue your quest it's 7!fight evil %compledgame | HALT }
    if ($readini(mnycount.ini,$nick,EXP) > 219) && (%currentrpgexp < 550) { notice $nick 10You are LVL4:7 210 have had4:7 $readini(mnycount.ini,$nick,FightNumber) 10fights and need4:7 $calc(550 - %currentrpgexp) 4EXP10 to lvl up 14(Total EXP %currentrpgexp $+ )10. %rpgwearing %rpgkilling %rpgluck You Have7: $readini(mnycount.ini,$nick,money) 10Credits.14 To continue your quest it's 7!fight evil2 %compledgame  | HALT }
    if ($readini(mnycount.ini,$nick,EXP) > 555) && (%currentrpgexp < 1300) { notice $nick 10You are LVL4:7 310 have had4:7 $readini(mnycount.ini,$nick,FightNumber) 10fights and need4:7 $calc(1300 - %currentrpgexp) 4EXP10 to lvl up 14(Total EXP %currentrpgexp $+ )10. %rpgwearing %rpgkilling %rpgluck You Have7: $readini(mnycount.ini,$nick,money) 10Credits.14 To continue your quest it's 7!fight evil3 %compledgame  | HALT }
    if ($readini(mnycount.ini,$nick,EXP) > 1300) && (%currentrpgexp < 2200) { notice $nick 10You are LVL4:7 410 have had4:7 $readini(mnycount.ini,$nick,FightNumber) 10fights and need4:7 $calc(2300 - %currentrpgexp) 4EXP10 to lvl up 14(Total EXP %currentrpgexp $+ )10. %rpgwearing %rpgkilling %rpgluck You Have7: $readini(mnycount.ini,$nick,money) 10Credits.14 To continue your quest it's 7!fight evil4 %compledgame  | HALT }
    if ($readini(mnycount.ini,$nick,EXP) > 2200) && (%currentrpgexp < 4150) { notice $nick 10You are LVL4:7 510 have had4:7 $readini(mnycount.ini,$nick,FightNumber) 10fights and need4:7 $calc(4150 - %currentrpgexp) 4EXP10 to lvl up 14(Total EXP %currentrpgexp $+ )10. %rpgwearing %rpgkilling %rpgluck You Have7: $readini(mnycount.ini,$nick,money) 10Credits. 14 To continue your quest it's 7!fight evil5  %compledgame  | HALT }
    if ($readini(mnycount.ini,$nick,EXP) > 4150) && (%currentrpgexp < 6399) { notice $nick 10You are LVL4:7 610 have had4:7 $readini(mnycount.ini,$nick,FightNumber) 10fights and need4:7 $calc(6399 - %currentrpgexp) 4EXP10 to lvl up 14(Total EXP %currentrpgexp $+ )10. %rpgwearing %rpgkilling %rpgluck You Have7: $readini(mnycount.ini,$nick,money) 10Credits. 14You've unlocked 4SHOP! 7!rpgshop %rpgwearing %rpgkilling 14To continue 7!fight evil6 %compledgame  | HALT }
    if ($readini(mnycount.ini,$nick,EXP) > 6400) && (%currentrpgexp < 10300) { notice $nick 10You are LVL4:7 710 have had4:7 $readini(mnycount.ini,$nick,FightNumber) 10fights and need4:7 $calc(10300 - %currentrpgexp) 4EXP10 to lvl up 14(Total EXP %currentrpgexp $+ )10. %rpgwearing %rpgkilling %rpgluck 10You Have7: $readini(mnycount.ini,$nick,money) 10Credits. 14 To continue your quest it's 7!fight evil7 %compledgame  | HALT }
    if ($readini(mnycount.ini,$nick,EXP) > 10300) && (%currentrpgexp < 16000) { notice $nick 10You are LVL4:7 810 have had4:7 $readini(mnycount.ini,$nick,FightNumber) 10fights and need4:7 $calc(16000 - %currentrpgexp) 4EXP10 to lvl up 14(Total EXP %currentrpgexp $+ )10. %rpgwearing %rpgkilling %rpgluck 10You Have7: $readini(mnycount.ini,$nick,money) 10Credits. 14 To continue your quest it's 7!fight evil8 %compledgame  | HALT }
    if ($readini(mnycount.ini,$nick,EXP) > 16000) && (%currentrpgexp < 19000) { notice $nick 10You are LVL4:7 910 have had4:7 $readini(mnycount.ini,$nick,FightNumber) 10fights and need4:7 $calc(19000 - %currentrpgexp) 4EXP10 to lvl up 14(Total EXP %currentrpgexp $+ )10. %rpgwearing %rpgkilling %rpgluck 10You Have7: $readini(mnycount.ini,$nick,money) 10Credits. 14 To continue your quest it's 7!fight evil9 %compledgame  | HALT }
    if ($readini(mnycount.ini,$nick,EXP) > 19000) && (%currentrpgexp < 23000) { notice $nick 10You are LVL4:7 1010 have had4:7 $readini(mnycount.ini,$nick,FightNumber) 10fights and need4:7 $calc(23000 - %currentrpgexp) 4EXP10 to lvl up 14(Total EXP %currentrpgexp $+ )10. %rpgwearing %rpgkilling %rpgluck 10You Have7: $readini(mnycount.ini,$nick,money) 10Credits. 14 To continue your quest it's 7!fight evil10 %compledgame  | HALT }
    if ($readini(mnycount.ini,$nick,EXP) > 23000) && (%currentrpgexp < 27000) { notice $nick 10You are LVL4:7 1110 have had4:7 $readini(mnycount.ini,$nick,FightNumber) 10fights and need4:7 $calc(27000 - %currentrpgexp) 4EXP10 to lvl up 14(Total EXP %currentrpgexp $+ )10. %rpgwearing %rpgkilling %rpgluck 10You Have7: $readini(mnycount.ini,$nick,money) 10Credits. 14 To continue your quest it's 7!fight evil11 %compledgame  | HALT }
    if ($readini(mnycount.ini,$nick,EXP) > 27000) && (%currentrpgexp < 32000) { notice $nick 10You are LVL4:7 1210 have had4:7 $readini(mnycount.ini,$nick,FightNumber) 10fights and need4:7 $calc(32000 - %currentrpgexp) 4EXP10 to lvl up 14(Total EXP %currentrpgexp $+ )10. %rpgwearing %rpgkilling %rpgluck 10You Have7: $readini(mnycount.ini,$nick,money) 10Credits. 14 To continue your quest it's 7!fight evil12 %compledgame  | HALT }
    if ($readini(mnycount.ini,$nick,EXP) > 32000) { notice $nick 10You are LVL4:7 1310 have had4:7 $readini(mnycount.ini,$nick,FightNumber) 10fights and earnt4:7 %currentrpgexp 4EXP10. %rpgwearing %rpgkilling %rpgluck 10You Have7: $readini(mnycount.ini,$nick,money) 10Credits. 14You have completed my game so far but if you would like to begin again with all purchases made: 7!restartrpg %compledgame  | HALT }
  }
  HALT
}

;############################ LUCIUS
;##### RPG SHOP SYSTEM ###### LUCIUS
;############################ LUCIUS

on *:TEXT:!rpgshop*:#: {
  if (!%replyflood. [ $+ [ $chan ] ]) {
    set -u8 %replyflood. [ $+ [ $chan ] ] ON 
    if (!$2) {
      if ($readini(mnycount.ini,$nick,EXP) < 4100) { notice $nick 10You haven't finished 07level7 5 10to open the shop yet! | HALT }
      msg $chan 07 $+ $nick 10is looking in the shop for more effective 07monster killing10 items!
      ;-------------#################################################################----------------
      ;-------------##########---------ITEM  LVL 6 EQUIPMENT SHOP-----------#########------------------
      ;-------------#################################################################----------------
      if ($readini(mnycount.ini,$nick,EXP) > 4100) {
        if ($readini(mnycount.ini,$nick,rpgweapon) == $null) {
          var %shopweapon 10A 4NEW 10weapon:7 Walking Staff 10@3 7500C 10to buy: 7!rpgshop staff
        }
        if ($readini(mnycount.ini,$nick,rpgarmour) == $null) {
          var %shoparmour 10A 4NEW10 armour:7 Leather Vest! 10@3 10000C 10to buy: 7!rpgshop leather
        }
        if ($readini(mnycount.ini,$nick,rpgweapon) == Staff) {
          var %shopweapon 10A 4NEW10 weapon:7 Short Sword 10@3 10000C 10to buy: 7!rpgshop ShortSword
        }
        if ($readini(mnycount.ini,$nick,rpgarmour) == Leather) {
          var %shoparmour 10A 4NEW5 armour:7 Hard Leather Vest! 10@3 15000C 10to buy: 7!rpgshop hardleather
        }
      }
      ;-------------#################################################################----------------
      ;-------------##########---------ITEM  LVL 7 EQUIPMENT SHOP-----------#########------------------
      ;-------------#################################################################----------------
      if ($readini(mnycount.ini,$nick,EXP) > 6400) {
        if ($readini(mnycount.ini,$nick,rpgweapon) == ShortSword) {
          var %shopweapon 10A 4NEW10 weapon:7 Spear 10@3 12000C 10to buy: 7!rpgshop spear
        }
        if ($readini(mnycount.ini,$nick,rpgarmour) == Hard Leather) {
          var %shoparmour 10A 4NEW10 armour:7 Plate Leather! 10@3 18000C 10to buy: 7!rpgshop plateleather
        }
        if ($readini(mnycount.ini,$nick,rpgcharm) == $null) { 
          var %shopcharm 10A 4NEW10 Charm:7 Lucky Ring Of Loose Change! 10@3 10000C 10to buy: 7!rpgshop loosechange
        }
      }
      ;-------------#################################################################----------------
      ;-------------##########---------ITEM  LVL 8 EQUIPMENT SHOP-----------#########------------------
      ;-------------#################################################################----------------

      if ($readini(mnycount.ini,$nick,EXP) > 10000) {
        if ($readini(mnycount.ini,$nick,rpgweapon) == Spear) {
          var %shopweapon 10A 4NEW10 weapon:7 LongSword 10@3 12000C 10to buy: 7!rpgshop longsword
        }
        if ($readini(mnycount.ini,$nick,rpgweapon) == Longsword) {
          var %shopweapon 10A 4NEW10 weapon:7 Two-Handed Sword 10@3 12000C 10to buy: 7!rpgshop twohands
        }
        if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Leather) {
          var %shoparmour 10A 4NEW10 armour:7 Ring Mail! 10@3 18000C 10to buy: 7!rpgshop ringmail
        }
        if ($readini(mnycount.ini,$nick,rpgarmour) == Ring Mail) {
          var %shoparmour 10A 4NEW10 armour:7 Plate Mail! 10@3 18000C 10to buy: 7!rpgshop platemail
        }
        if ($readini(mnycount.ini,$nick,rpgcharm) == Hoarding) { 
          var %shopcharm 10A 4NEW10 Charm:7 Lucky Ring Of Fortuitous Fortunes! 10@3 10000C 10to buy: 7!rpgshop fortunes
        }
        if ($readini(mnycount.ini,$nick,rpgcharm) == Loose Change) { 
          var %shopcharm 10A 4NEW10 Charm:7 Lucky Ring Of Hoarding! 10@3 10000C 10to buy: 7!rpgshop hoarding
        }
      }
      ;----------###################################################################------------
      ;----------######  ------- LEVEL (10) WEAPONS & ARMOUR & CHARM ------- #######-------------
      ;----------###################################################################------------

      if ($readini(mnycount.ini,$nick,EXP) > 19000) {
        if ($readini(mnycount.ini,$nick,rpgweapon) == Two-Handed Sword) {
          var %shopweapon 10A 4NEW10 weapon:7 Fighting Axe! 10@3 12000C 10to buy: 7!rpgshop fightingaxe
        }
        if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Mail) {
          var %shoparmour 10A 4NEW10 armour:7 Steel Plate! 10@3 18000C 10to buy: 7!rpgshop steelplate
        }
        if ($readini(mnycount.ini,$nick,rpgcharm) == Fortuitous Fortunes) { 
          var %shopcharm 10A 4NEW10 Charm:7 Lucky Ring Of Gold Hunter! 10@3 10000C 10to buy: 7!rpgshop goldhunter
        }
      }
      ;----------###################################################################------------
      ;----------######  HERE IS THE NEXT LEVEL (11) WEAPONS & ARMOUR & CHARM #######-------------
      ;----------###################################################################------------

      if ($readini(mnycount.ini,$nick,EXP) > 23000) {
        if ($readini(mnycount.ini,$nick,rpgweapon) == Fighting Axe) {
          var %shopweapon 10A 4NEW10 weapon:7 Throwing Axe! 10@3 12000C 10to buy: 7!rpgshop throwingaxe
        }
        if ($readini(mnycount.ini,$nick,rpgarmour) == Steel Plate) {
          var %shoparmour 10A 4NEW10 armour:7 Hedge Knight! 10@3 18000C 10to buy: 7!rpgshop hedgeknight
        }
        if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Hunter) { 
          var %shopcharm 10A 4NEW10 Charm:7 Lucky Ring Of Gold Thieving! 10@3 10000C 10to buy: 7!rpgshop goldthieving
        }
      }
      ;----------###################################################################------------
      ;----------######  HERE IS THE NEXT LEVEL (12) WEAPONS & ARMOUR & CHARM #######-------------
      ;----------###################################################################------------

      if ($readini(mnycount.ini,$nick,EXP) > 27000) {
        if ($readini(mnycount.ini,$nick,rpgweapon) == Throwing Axe) {
          var %shopweapon 10A 4NEW10 weapon:7 Twinblade Axe! 10@3 13000C 10to buy: 7!rpgshop twinbladeaxe
        }
        if ($readini(mnycount.ini,$nick,rpgarmour) == Hedge Knight) {
          var %shoparmour 10A 4NEW10 armour:7 Horse Knight! 10@3 19000C 10to buy: 7!rpgshop horseknight
        }
        if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Thieving) { 
          var %shopcharm 10A 4NEW10 Charm:7 Lucky Ring Of Trader! 10@3 11000C 10to buy: 7!rpgshop trader
        }
      }

      ;-----------###############-----------SHOP MESSAGE----------####################-------
      if (%shoparmour) || (%shopweapon) || (%shopcharm) { notice $nick 10Available4: %shopweapon %shoparmour %shopcharm | HALT }
      if (!%shoparmour) && (!%shopweapon) && (!%shopcharm) { notice $nick 10There is nothing available for you at the moment. | HALT }
    }
    ;-------------##########################################################----------------
    ;-------------##########---------ITEM  LVL 6 BUYING-----------##########------------------
    ;-------------##########################################################----------------
    if ($2 == leather) && ($readini(mnycount.ini,$nick,money) > 10000) && ($readini(mnycount.ini,$nick,rpgarmour) == $null) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 10000)
      writeini -n mnycount.ini $nick rpgarmour Leather
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Leather ARMOUR 10for 310000C4!!!
    }
    if ($2 == staff) && ($readini(mnycount.ini,$nick,money) > 7500) && ($readini(mnycount.ini,$nick,rpgweapon) == $null) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 7500)
      writeini -n mnycount.ini $nick rpgweapon Staff
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Walking Staff 10for 37500C4!!!
    }
    if ($2 == hardleather) && ($readini(mnycount.ini,$nick,money) > 15000) && ($readini(mnycount.ini,$nick,rpgarmour) == Leather) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 15000)
      writeini -n mnycount.ini $nick rpgarmour Hard Leather
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Hard Leather ARMOUR 10for 315000C4!!!
    }
    if ($2 == shortsword) && ($readini(mnycount.ini,$nick,money) > 10000) && ($readini(mnycount.ini,$nick,rpgweapon) == Staff) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 10000)
      writeini -n mnycount.ini $nick rpgweapon ShortSword
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7ShortSword 10for 310000C4!!!
    }
    ;-------------##########################################################----------------
    ;-------------##########---------ITEM  LVL 7 BUYING-----------##########------------------
    ;-------------##########################################################----------------
    if ($2 == spear) && ($readini(mnycount.ini,$nick,money) > 12000) && ($readini(mnycount.ini,$nick,rpgweapon) == ShortSword) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 12000)
      writeini -n mnycount.ini $nick rpgweapon Spear
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Spear 10for 312000C4!!!
    }
    if ($2 == plateleather) && ($readini(mnycount.ini,$nick,money) > 18000) && ($readini(mnycount.ini,$nick,rpgarmour) == Hard Leather) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 18000)
      writeini -n mnycount.ini $nick rpgarmour Plate Leather
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Plate Leather ARMOUR 10for 318000C4!!!
    }
    if ($2 == loosechange) && ($readini(mnycount.ini,$nick,money) > 10000) && ($readini(mnycount.ini,$nick,rpgcharm) == $null) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 10000)
      writeini -n mnycount.ini $nick rpgcharm Loose Change
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Lucky Ring Of Loose Change 10for 310000C4!!! 14You will now find 3250C14 extra from every win!
    } 
    ;-------------##########################################################----------------
    ;-------------##########---------ITEM  LVL 8 BUYING-----------##########------------------
    ;-------------##########################################################----------------
    if ($2 == longsword) && ($readini(mnycount.ini,$nick,money) > 12000) && ($readini(mnycount.ini,$nick,rpgweapon) == Spear) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 12000)
      writeini -n mnycount.ini $nick rpgweapon Longsword
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Longsword 10for 312000C4!!!
    }

    if ($2 == twohands) && ($readini(mnycount.ini,$nick,money) > 12000) && ($readini(mnycount.ini,$nick,rpgweapon) == Longsword) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 12000)
      writeini -n mnycount.ini $nick rpgweapon Two-Handed Sword
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Two-Handed Sword 10for 312000C4!!!
    }

    if ($2 == ringmail) && ($readini(mnycount.ini,$nick,money) > 18000) && ($readini(mnycount.ini,$nick,rpgarmour) == Plate Leather) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 18000)
      writeini -n mnycount.ini $nick rpgarmour Ring Mail
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Ring Mail ARMOUR 10for 318000C4!!!
    }

    if ($2 == platemail) && ($readini(mnycount.ini,$nick,money) > 18000) && ($readini(mnycount.ini,$nick,rpgarmour) == Ring Mail) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 18000)
      writeini -n mnycount.ini $nick rpgarmour Plate Mail
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Plate Mail ARMOUR 10for 318000C4!!!
    }

    if ($2 == hoarding) && ($readini(mnycount.ini,$nick,money) > 10000) && ($readini(mnycount.ini,$nick,rpgcharm) == Loose Change) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 10000)
      writeini -n mnycount.ini $nick rpgcharm Hoarding
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Lucky Ring Of Hoarding 10for 310000C4!!! 14You will now find 3400C14 extra from every win!
    } 

    if ($2 == fortunes) && ($readini(mnycount.ini,$nick,money) > 10000) && ($readini(mnycount.ini,$nick,rpgcharm) == Hoarding) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 10000)
      writeini -n mnycount.ini $nick rpgcharm Fortuitous Fortunes
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Lucky Ring Of Fortuitous Fortunes 10for 310000C4!!! 14You will now find 3600C14 extra from every win!
    } 

    ;-------------##########################################################----------------
    ;-------------##########---------ITEM  LVL 10 BUYING-----------#########-----------------
    ;-------------##########################################################----------------

    if ($2 == goldhunter) && ($readini(mnycount.ini,$nick,money) > 10000) && ($readini(mnycount.ini,$nick,rpgcharm) == Fortuitous Fortunes) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 10000)
      writeini -n mnycount.ini $nick rpgcharm Gold Hunter
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Lucky Ring Of Gold Hunter 10for 310000C4!!! 14You will now find 3800C14 extra from every win!
    } 

    if ($2 == steelplate) && ($readini(mnycount.ini,$nick,money) > 18000) && ($readini(mnycount.ini,$nick,rpgarmour) == Plate Mail) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 18000)
      writeini -n mnycount.ini $nick rpgarmour Steel Plate
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Steel Plate ARMOUR 10for 318000C4!!!
    }

    if ($2 == fightingaxe) && ($readini(mnycount.ini,$nick,money) > 12000) && ($readini(mnycount.ini,$nick,rpgweapon) == Two-Handed Sword) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 12000)
      writeini -n mnycount.ini $nick rpgweapon Fighting Axe
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Fighting Axe 10for 312000C4!!!
    }

    ;-------------##########################################################----------------
    ;-------------##########---------ITEM  LVL 11 BUYING-----------#########-----------------
    ;-------------##########################################################----------------

    if ($2 == goldthieving) && ($readini(mnycount.ini,$nick,money) > 10000) && ($readini(mnycount.ini,$nick,rpgcharm) == Gold Hunter) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 10000)
      writeini -n mnycount.ini $nick rpgcharm Gold Thieving
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Lucky Ring Of Gold Thieving 10for 310000C4!!! 14You will now find 31,000C14 extra from every win!
    } 

    if ($2 == hedgeknight) && ($readini(mnycount.ini,$nick,money) > 18000) && ($readini(mnycount.ini,$nick,rpgarmour) == Steel Plate) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 18000)
      writeini -n mnycount.ini $nick rpgarmour Hedge Knight
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Hedge Knight ARMOUR 10for 318000C4!!!
    }

    if ($2 == throwingaxe) && ($readini(mnycount.ini,$nick,money) > 12000) && ($readini(mnycount.ini,$nick,rpgweapon) == Fighting Axe) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 12000)
      writeini -n mnycount.ini $nick rpgweapon Throwing Axe
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Throwing Axe 10for 312000C4!!!
    }
    ;-------------##########################################################----------------
    ;-------------##########---------ITEM  LVL 12 BUYING-----------#########-----------------
    ;-------------##########################################################----------------

    if ($2 == trader) && ($readini(mnycount.ini,$nick,money) > 11000) && ($readini(mnycount.ini,$nick,rpgcharm) == Gold Thieving) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 11000)
      writeini -n mnycount.ini $nick rpgcharm Trader
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Lucky Ring Of Trader 10for 311000C4!!! 14You will now find 31,200C14 extra from every win!
    } 

    if ($2 == horseknight) && ($readini(mnycount.ini,$nick,money) > 19000) && ($readini(mnycount.ini,$nick,rpgarmour) == Hedge Knight) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 19000)
      writeini -n mnycount.ini $nick rpgarmour Horse Knight
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Horse Knight ARMOUR 10for 319000C4!!!
    }

    if ($2 == twinbladeaxe) && ($readini(mnycount.ini,$nick,money) > 13000) && ($readini(mnycount.ini,$nick,rpgweapon) == Throwing Axe) {
      var %rpgbuymoney $calc($readini(mnycount.ini,$nick,money) - 13000)
      writeini -n mnycount.ini $nick rpgweapon Twinblade Axe
      writeini -n mnycount.ini $nick money $($+(%rpgbuymoney),2)
      notice $nick 10You just bought 7Twinblade Axe 10for 313000C4!!!
    }

  }
  HALT
}

;########################### LUCIUS
;###### FIGHTINGSTATS ###### LUCIUS
;########################### LUCIUS

on *:TEXT:!myfights*:#: {
  tokenize 32 $strip($1-)
  if (!%replyflood. [ $+ [ $chan ] ]) {
    set -u6 %replyflood. [ $+ [ $chan ] ] ON 
    var %fightingstats 10You have fought4:7 $calc($readini(mnycount.ini,$nick,WINNER) + $readini(mnycount.ini,$nick,LOSER) + $readini(mnycount.ini,$nick,TIE)) 10times. 
    if ($readini(mnycount.ini,$nick,WINNER)) {
      var %won 7 $readini(mnycount.ini,$nick,WINNER) 10Wins.
    }
    if ($readini(mnycount.ini,$nick,LOSER)) {
      var %lost 7 $readini(mnycount.ini,$nick,LOSER) 10Losses.
    }
    if ($readini(mnycount.ini,$nick,TIE)) {
      var %ties 7 $readini(mnycount.ini,$nick,TIE) 10Ties.
    }
    if ($readini(mnycount.ini,$nick,armour)) {
      var %havearmour 10You wear4:7 $readini(mnycount.ini,$nick,armour) armour

    }
    if ($readini(mnycount.ini,$nick,weapon)) {
      var %haveweapon 10Your weapon is a4:7 $readini(mnycount.ini,$nick,weapon)
    }
    if (%fightingstats) { 
      notice $nick 10 %fightingstats %won %lost %ties %haveweapon %havearmour
    }
  }
  HALT
}

;############################################## LUCIUS 
;######THIS IS MY HOME MADE FIGHT SCRIPT!###### LUCIUS
;############################################## LUCIUS

on *:TEXT:!fight *:#: {
  tokenize 32 $strip($1-)
  if (!%fightflood. [ $+ [ $chan ] ]) {
    if ($2 != evil) {
      if ($mid($2,5,1) !isnum) {
        if (!%replyflood. [ $+ [ $chan ] ]) {
          set -u8 %replyflood. [ $+ [ $chan ] ] ON 
          set -u5 %fightflood. [ $+ [ $chan ] ] ON
          if ($2 !ison $chan) { msg $chan 10You can't fight someone who isn't here4!!! | HALT }
          if ($nick == $2)  { msg $chan 10FOOL wanna kick your own ass?  I bet you'd 4still10 lose, on both sides! | HALT }
          if ($2 == $hget(owned,$nick)) { msg $chan 4NO! 10Bad 4SLAVE!7 $2 10is your 4master10 and you can't fight them! | HALT }
          if ($readini(mnycount.ini,$2,money) < 500) { msg $chan 10you shouldn't fight with the poor7 $nick $+10... | HALT }
          if (!$readini(mnycount.ini,$2,money)) { msg $chan 7 $+ $nick $+ 10... I can't let you fight7 $2 10if they don't have an account with me, I don't take lint as payment. | HALT }
          if ($readini(mnycount.ini,$2,money) > 500) {
            var %fighttext $rand(1,5)
            var %fightroom $chan
            var %attacker $nick
            var Þfender $2
            var %luck $rand(1,25)
            var Þfence $rand(1,15)
            var %attack $rand(1,20)
            var %moneyluck $rand(20,200)
            var %attstuff $rand(1,5)
            var Þfstuff $rand(1,5)
            if ($readini(mnycount.ini,$nick,weapon) == shortsword) { var %weapon 6 }
            if ($readini(mnycount.ini,$nick,weapon) == knife) { var %weapon 3 }
            if ($readini(mnycount.ini,$2,armour) == leather) { var %armour 5 }
            if ($readini(mnycount.ini,$2,armour) == ringmail) { var %armour 8 }
            if (%fighttext == 1) { set %fightmessage 7 $+ $nick 10smacks7 $2 10in the face, the fight is on4! }
            if (%fighttext == 2) { set %fightmessage 7 $+ $nick 10runs up to7 $2 10and lays down the gauntlet4! }
            if (%fighttext == 3) { set %fightmessage 7 $+ $2 10has a fresh challenger by the name of7 $nick $+ 4! }
            if (%fighttext == 4) { set %fightmessage 7 $+ $nick 10gets all up in7 Þfender $+ 10's face, itching for a fight4! }
            if (%fighttext == 5) { set %fightmessage 10The scene is set,7 $nick 10Versus7 Þfender 10in a fight for supremecy4! }
            msg $chan %fightmessage
            if ($calc(Þfence + %luck + %armour) > $calc(%attack + %luck + %weapon)) {
              var %lost $calc($readini(mnycount.ini,$nick,LOSER) + 1)
              writeini -n mnycount.ini $nick LOSER $($+(%lost),2)
              var %winner $calc($readini(mnycount.ini,$2,WINNER) + 1)
              writeini -n mnycount.ini $2 WINNER $($+(%winner),2)
              if (Þfstuff == 1) { set Þfmessage 7 $+ Þfender 10laughs at the pitiful attempts from7 %attacker $+ 10. }
              if (Þfstuff == 2) { set Þfmessage 7 $+ Þfender 10blocks every strike easily from7 %attacker $+ 10. }
              if (Þfstuff == 3) { set Þfmessage 7 $+ Þfender 10ends it quickly with a Chuck Norris style roundhouse. }
              if (Þfstuff == 4) { set Þfmessage 7 $+ Þfender 10disembowels7 %attacker $+ 10 without remorse. }
              if (Þfstuff == 5) { set Þfmessage 7 $+ Þfender 10removes7 %attacker $+ 10's spleen in their finishing move. }
              if (%attstuff == 1) { set %attmessage 10There is no pity for7 %attacker $+ 10's loss, they started it. }
              if (%attstuff == 2) { set %attmessage 7 $+ %attacker 10got 4PWN10d by7 Þfender $+ 10, they defended their honour, and 3C10redits too. }
              if (%attstuff == 3) { set %attmessage 10Will7 %attacker 10ever live down the humiliation? }
              if (%attstuff == 4) { set %attmessage 10Making the first move didn't stop7 %attacker 10from getting their ass kicked. }
              if (%attstuff == 5) { set %attmessage 10Was it worth it7 %attacker $+ 10? We all saw you PHAIL huge. }
              .timer 1 2 msg %fightroom Þfmessage %attmessage   14 $readini(mnycount.ini,$nick,LOSER) losses.
              if ($readini(mnycount.ini,$nick,LOSER) < 150) && ($readini(mnycount.ini,$nick,LOSER) > 50) && (!$readini(mnycount.ini,$nick,weapon)) {
                .timer 1 3 notice %attacker 10You now qualify as 4Trainee Loser! 10Having7 %lost 10losses you can now buy a knife!:7 ~knife 10for 31000C
              }
              if ($readini(mnycount.ini,$nick,LOSER) < 250) && ($readini(mnycount.ini,$nick,LOSER) > 150) && ($readini(mnycount.ini,$nick,weapon) != shortsword) {
                .timer 1 3 notice %attacker 10You now qualify as 4Practiced Loser! 10Having7 %lost 10losses you can now buy a shortsword!:7 ~shortsword 10for 32000C
              }
            }
            if ($calc(Þfence + %luck + %armour) < $calc(%attack + %luck + %weapon)) {
              var %lost $calc($readini(mnycount.ini,$2,LOSER) + 1)
              writeini -n mnycount.ini $2 LOSER $($+(%lost),2)
              var %winner $calc($readini(mnycount.ini,$nick,WINNER) + 1)
              writeini -n mnycount.ini $nick WINNER $($+(%winner),2)
              if (Þfstuff == 1) { set Þfmessage 7 $+ Þfender 10struggles to block the attacks from7 %attacker 10and then... }
              if (Þfstuff == 2) { set Þfmessage 7 $+ Þfender 10is outmatched from the start, unable to stop7 %attacker $+ 10's PwNaGe... }
              if (Þfstuff == 3) { set Þfmessage 7 $+ Þfender $+ 10's attacks are turned or countered again and again... }
              if (Þfstuff == 4) { set Þfmessage 7 $+ Þfender 10attacks all out but7 %attacker 10is constantly one step ahead... }
              if (Þfstuff == 5) { set Þfmessage 7 $+ Þfender 10strikes 7 %attacker 10and hits a log instead11 SUBSTITUTION JUTSU10... }
              if (%attstuff == 1) { set %attmessage 4 $+ CENSORED!7 %attacker 10wipes the blood from their face and loots the corpse. }
              if (%attstuff == 2) { set %attmessage 7 $+ %attacker 10detatches7 Þfender $+ 10's head in record time, holding it by an ear as they kick the spurting body away. }
              if (%attstuff == 3) { set %attmessage 10Artfully,7 %attacker 10dances with death, blood and guts fly from7 Þfender $+ 10. }
              if (%attstuff == 4) { set %attmessage 7 $+ Þfender 10loses consciousness from a well aimed blow and it gets worse from there. People have to drag7 %attacker 10off them eventually don't they? }
              if (%attstuff == 5) { set %attmessage 7 $+ %attacker 10suddenly sits down and starts praying,7 Þfender 10drops to the floor as a 4Demon 10directly removes their soul and eats it. }
              .timer 1 2 msg %fightroom Þfmessage %attmessage   14 $readini(mnycount.ini,$nick,WINNER) wins.
              var %wonmoney $calc((%moneyluck * 4)+ $readini(mnycount.ini,$nick,money))
              var %lostmoney $calc($readini(mnycount.ini,$2,money)- %moneyluck))
              .timer 1 6 msg %fightroom 10Let's collect the bets and winnings4...7 $nick won3 $calc(%moneyluck * 4) $+ C10,7 $2 10making up4 25% 10of the winnings by losing3 %moneyluck $+ C
              writeini -n mnycount.ini $nick money $($+(%wonmoney),2)
              writeini -n mnycount.ini $2 money $($+(%lostmoney),2)
              if ($readini(mnycount.ini,$nick,WINNER) > 100) && ($readini(mnycount.ini,$nick,WINNER) < 250) && (!$readini(mnycount.ini,$nick,armour)) {
                .timer 1 3 notice %attacker 10You now qualify as 4Trainee Killer! 10Having kicked7 %winner 10asses you can now buy leather armour!:7 ~leather 10for 31000C
              }
              if ($readini(mnycount.ini,$nick,WINNER) < 250) && ($readini(mnycount.ini,$nick,WINNER) > 175) && ($readini(mnycount.ini,$nick,armour) != ringmail) {
                .timer 1 3 notice %attacker 10You now qualify as 4Practiced Killer! 10Having kicked7 %winner 10asses you can now buy ringmail armour!:7 ~ringmail 10for 32000C
              }
            }
            if ($calc(Þfence + %luck + %armour) == $calc(%attack + %luck + %weapon)) {
              var %tie $calc($readini(mnycount.ini,$2,TIE) + 1)
              writeini -n mnycount.ini $2 TIE $($+(%tie),2)
              var %tie2 $calc($readini(mnycount.ini,$nick,TIE) + 1)
              writeini -n mnycount.ini $nick TIE $($+(%tie2),2)
              .timer 1 3 msg %fightroom 7 %attacker 10and7 Þfender 10both drop to the ground, having traded blows until collapse4!!! 14Ties: %attacker $readini(mnycount.ini,$nick,TIE) and Þfender $readini(mnycount.ini,$2,TIE) $+ .
            }
          }
        }
      }
    }
  }

  ;######################################## LUCIUS
  ;####THIS IS MY HOME MADE RPG SCRIPT!#### LUCIUS
  ;######################################## LUCIUS

  if ($2 == evil) && (!$3) {
    if ($readini(mnycount.ini,$nick,EXP) > 225) {
      notice $nick 4You have beaten this level already. 
      HALT
    }
    set -u12 %rpgflood. [ $+ [ $chan ] ] ON
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u12 %replyflood. [ $+ [ $chan ] ] ON 

      if (!$readini(mnycount.ini,$nick,EXP)) { 
        writeini -n mnycount.ini $nick EXP 1 
      }
      if ($readini(mnycount.ini,$nick,EXP) < 220) {
        var %rpgfight $calc($readini(mnycount.ini,$nick,FightNumber) + 1)
        writeini -n mnycount.ini $nick FightNumber $($+(%rpgfight),2)
      }
      var %monsterdefence $rand(1,17)
      ;--### Charm additions ###
      if ($readini(mnycount.ini,$nick,rpgcharm) == $null) { var %mkc 1 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Loose Change) { var %mkc 250 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Hoarding) { var %mkc 400 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Fortuitous Fortunes) { var %mkc 600 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Hunter) { var %mkc 800 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Thieving) { var %mkc 1000 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Trader) { var %mkc 1200 }

      ;--### Armour additions ###
      if ($readini(mnycount.ini,$nick,rpgarmour) == $null) { var %mkw 1 }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Leather) { var %mkw $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hard Leather) { var %mka $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Leather) { var %mka $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Ring Mail) { var %mka $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Mail) { var %mka $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Steel Plate) { var %mka $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hedge Knight) { var %mka $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Horse Knight) { var %mka $rand(15,20) }

      ;--### Weapon additions ###
      if ($readini(mnycount.ini,$nick,rpgweapon) == $null) { var %mkw 1 }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Staff) { var %mkw $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Shortsword) { var %mkw $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Spear) { var %mkw $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Longsword) { var %mkw $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Two-Handed Sword) { var %mkw $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Fighting Axe) { var %mkw $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Throwing Axe) { var %mkw $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Twinblade Axe) { var %mkw $rand(15,20) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Halberd) { var %mkw $rand(18,23) }
      var %monsterkiller $calc(%mkw + %mka + $rand(1,35))

      ;#########################
      ;##### BOSS BATTLE 1 #####
      ;#########################
      if ($readini(mnycount.ini,$nick,EXP) >= 200) {
        if (!%ONEfight) {
          set -u4 %ONEfight on
          if ($readini(mnycount.ini,$nick,EXP) < 225) { 
            msg $chan 4BOSS BATTLE!!! 10Your 7Parent/Guardian 10just saw you trying to sneak off on a quest! 4ARGUE YOUR CAUSE!
            var %bossexp $calc($readini(mnycount.ini,$nick,EXP) + 35)
            var %response $rand(1,8)
            if (%response == 1) || (%response == 2) {
              timer 1 5 msg $chan 10They didn't believe you had the backpack to practice walking under weight and sent you back to do chores. :/
              HALT 
            }
            if (%response == 3) {
              timer 1 5 msg $chan 10They believed you were off to the shop! Quick thinking, but wait...  
              timer 1 10 msg $chan 10They want to come too! 4You lost 3300C4 convincing them you needed the backpack just to go to the shop.
              var %shopspent $calc($readini(mnycount.ini,$nick,money) - 300)
              writeini -n mnycount.ini $nick money $($+(%shopspent),2)
              HALT 
            } 
            if (%response == 4) {
              timer 1 5 msg $chan 10Knowing you can't explain the backpack and supplies you run off before they get close.
              timer 1 10 msg $chan 10They give chase but you get away, leaving them panting and looking at you in dismay. 4 35EXP. 10Who Cares?  YOU ARE NOW LVL 2! 
              timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
              writeini -n mnycount.ini $nick EXP $($+(%bossexp),2)
              HALT
            }
            if (%response == 5) || (%response == 6) {
              timer 1 5 msg $chan 10With some quick talk about friends camping and a hint of pleading, they let you 'go camping'.
              timer 1 10 msg $chan 10They will start to worry in a few days...4 35EXP. 10Who Cares?  YOU ARE NOW LVL 2! 
              timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
              writeini -n mnycount.ini $nick EXP $($+(%bossexp),2)
              HALT
            }
            if (%response == 7) || (%response == 8) {
              timer 1 5 msg $chan 10With a sigh you take off your adventuring equipment and tell them the truth about the quest you randomly began.  
              timer 1 10 msg $chan 10Suddenly you are turned around, supplies on your back and an extra 31000C10 in your pocket. The last words you remember hearing... "I wish I'd had a quest when I was young."7 7510EXP gained for the truth! 4LVL 2!
              timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
              var %bossexpa $calc(%bossexp + 40)
              var %extracash $calc($readini(mnycount.ini,$nick,money) + 1000)
              writeini -n mnycount.ini $nick money $($+(%extracash),2)
              writeini -n mnycount.ini $nick EXP $($+(%bossexpa),2)
              HALT
            }
          }
        }
      }
      ;##################################
      ;##### LVL 1 SPECIFIC BATTLE! #####
      ;##################################
      if ($readini(mnycount.ini,$nick,EXP) <= 199) {
        if (!%ONEfight) {
          set -u4 %ONEfight on
          var %monster $read(monsters.txt)
          msg $chan 7 $+ $nick 10has barely begun their quest, coming face to face with a:7 %monster $+ 7!!!
          ;####### MONSTER WIN #######
          if (%monsterdefence > %monsterkiller) {
            timer 1 4 msg $chan 7 %monster 10beat a hasty retreat and got away!
            HALT
          }
          ;######## TIE ########
          if (%monsterdefence == %monsterkiller) {
            timer 1 4 msg $chan 10OH NO7 $nick 10& the7 %monster 4BOTH 10struck massive blows, stunning their enemy but knocked unconscious in the same breath.
            HALT
          }
          ;######## PLAYER WIN ########
          if (%monsterdefence < %monsterkiller) {
            var %EXP $rand(10,20)
            var %monsterloot $calc($rand(1,100) + %mkc)
            timer 1 4 msg $chan 10The7 %monster 10was defeated with much bravery and heroism!7  $nick 10earned4 %EXP EXP10 and looted3 %monsterloot $+ C 14[ $+ $ord($readini(mnycount.ini,$nick,FightNumber)) fight]
            var %killmoney $calc($readini(mnycount.ini,$nick,money) + %monsterloot)
            var %expearnt $calc($readini(mnycount.ini,$nick,EXP) + %EXP)
            writeini -n mnycount.ini $nick EXP $($+(%expearnt),2)
            writeini -n mnycount.ini $nick money $($+(%killmoney),2)
            HALT
          }
        }
      }
    }
  }
  ;######################################################################
  ;##################################### LUCIUS
  ;########### RPG LEVEL 2 ############# LUCIUS
  ;##################################### LUCIUS
  ;######################################################################
  ; && ($chan != #Adultchat)
  if (!%rpgflood. [ $+ [ $chan ] ]) && ($2 == evil2) && ($readini(mnycount.ini,$nick,EXP) > 231) {
    if ($readini(mnycount.ini,$nick,EXP) > 550) {
      notice $nick 4You have beaten this level already. 
      HALT
    }
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u12 %replyflood. [ $+ [ $chan ] ] ON 
      set -u12 %rpgflood. [ $+ [ $chan ] ] ON
      var %chan $chan
      var %md2 $rand(1,17)
      ;--### Charm additions ###
      if ($readini(mnycount.ini,$nick,rpgcharm) == $null) { var %mkc2 1 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Loose Change) { var %mkc2 250 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Hoarding) { var %mkc2 400 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Fortuitous Fortunes) { var %mkc2 600 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Hunter) { var %mkc2 800 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Thieving) { var %mkc2 1000 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Trader) { var %mkc2 1200 }

      ;--### Armour additions ###
      if ($readini(mnycount.ini,$nick,rpgarmour) == $null) { var %mkw2 1 }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Leather) { var %mkw2 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hard Leather) { var %mka2 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Leather) { var %mka2 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Ring Mail) { var %mka2 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Mail) { var %mka2 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Steel Plate) { var %mka2 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hedge Knight) { var %mka2 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Horse Knight) { var %mka2 $rand(15,20) }

      ;--### Weapon additions ###
      if ($readini(mnycount.ini,$nick,rpgweapon) == $null) { var %mkw2 1 }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Staff) { var %mkw2 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Shortsword) { var %mkw2 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Spear) { var %mkw2 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Longsword) { var %mkw2 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Two-Handed Sword) { var %mkw2 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Fighting Axe) { var %mkw2 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Throwing Axe) { var %mkw2 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Twinblade Axe) { var %mkw2 $rand(15,20) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Halberd) { var %mkw2 $rand(18,23) }
      var %mk2 $calc(%mkw2 + %mka2 + $rand(1,30))

      var %rpgfight2 $calc($readini(mnycount.ini,$nick,FightNumber) + 1)
      writeini -n mnycount.ini $nick FightNumber $($+(%rpgfight2),2)
      ;#########################################
      ;######## LVL 2 SPECIFIC BATTLE! #########
      ;#########################################
      if ($readini(mnycount.ini,$nick,EXP) < 500) {
        if (!%ONEfight2) {
          var %monsterloot2 $calc($rand(1,400) + %mkc2)
          var %killmoney2 $calc($readini(mnycount.ini,$nick,money) + %monsterloot2)
          var %EXP2 $rand(10,35)
          var %expearnt2 $calc($readini(mnycount.ini,$nick,EXP) + %EXP2)
          var %monster2 $read(monsters2.txt)
          var %meet1 7 $+ $nick 10is heading out on their quest, coming face to face with :7 %monster2 $+ 7!!!
          var %meet2 7 $+ $nick 10is heading out on their quest, suprising :7 %monster2 $+ 7!!!
          var %meet3 7 $+ $nick 10is heading out on their quest, when pounced by :7 %monster2 $+ 7!!!
          var %meet4 7 $+ $nick 10is heading out on their quest, stumbling over :7 %monster2 $+ 7!!!
          var %meet5 7 $+ $nick 10is heading out on their quest, chancing upon :7 %monster2 $+ 10 with it's back turned7!!!
          msg $chan %meet [ $+ [ $r(1,5) ] ]
          set -u4 %ONEfight2 on
          if (%md2 < %mk2) {  
            writeini -n mnycount.ini $nick EXP $($+(%expearnt2),2)
            writeini -n mnycount.ini $nick money $($+(%killmoney2),2)
            timer 1 4 msg %chan 10A win! The7 %monster2 10didn't stand a chance.4 %EXP2 EXP10 and gained3 %monsterloot2  C
          }
          if (%md2 > %mk2) {
            timer 1 4 msg %chan 7 %monster2 10managed to get away with minor damage!
          }
          if (%md2 == %mk2) {
            timer 1 5 msg %chan 10OH NO!7 $nick 10&7 %monster2 4BOTH 10struck massive blows, knocking out their enemy but the world turning black in the same breath.
          }
        }
      }
      ;###############################
      ;######## BOSS BATTLE 2 ########
      ;###############################
      if ($readini(mnycount.ini,$nick,EXP) >= 500) && ($readini(mnycount.ini,$nick,EXP) < 550) {
        if (!%ONEfight2) {
          set -u4 %ONEfight2 on 
          msg $chan 4BOSS BATTLE!!! 10On the outskirts of their home-town $nick finds a7 Thief4!!!  10He looks desperate and wants all your money!
          var %bossexp2 $calc($readini(mnycount.ini,$nick,EXP) + 100)
          var %response2 $rand(1,8)
          if (%response2 == 1) || (%response2 == 2) {
            timer 1 5 msg $chan 10The 7Thief10 is much tougher than $nick expected.  He disarms you and ties you up, then stabs you in a rage when he learns you own next to nothing.
            timer 1 10 msg $chan 10A local finds you trussed and bleeding, so carries you off to the healer, you'll have to try leaving the area again...
            HALT 
          }
          if (%response2 == 3) {
            timer 1 5 msg $chan 10The 7Thief10 is much tougher than $nick expected.  He disarms you and ties you up, leaving you next to your ransacked backpack, struggling to free yourself...
            timer 1 10 msg $chan 4You lost the 31000C4 10in your pocket but luckily he didn't find the rest stashed in the backpack's secret lining. After getting free, you head back to restock.
            var %spent $calc($readini(mnycount.ini,$nick,money) - 1000)
            writeini -n mnycount.ini $nick money $($+(%spent),2)
            HALT 
          } 
          if (%response2 == 4) {
            timer 1 5 msg $chan 7 $+ $nick 10is not quite the hero they wish to be, you run around him and dash into the wilderness beyond..
            timer 1 10 msg $chan 10The 7Thief 4gives chase but you get away by making your way deep into the nearby forest. 4 100EXP. 10Nobody said questing would be so scary... 
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp2),2)
            HALT
          }
          if (%response2 == 6) || (%response2 == 5) {
            timer 1 5 msg $chan 10Shrugging off the pack,7 $nick 10advances head on with the 7Thief10 guessing his shifty eyes prefer an easy target.
            timer 1 10 msg $chan 10You were right!  He watches you for all of 5 steps until he sees the determination in your eye and runs away!4 100EXP 10You walk on with head held high and into the forest beyond.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp2),2)
            HALT
          }
          if (%response2 == 7) || (%response2 == 8) {
            timer 1 5 msg $chan 10Unable to hide the fear7 $nick 10stops and watches him approach...  Hand in their pocket and gripping the paring knife taken from home.  
            timer 1 10 msg $chan 10His steps get confident and he pauses to leer over you. 7"4Hand over all y~!!!7"10 Your knife meets his throat and ends his life in moments. 35000C10 he had in his pocket. 15010EXP gained for ridding the world of the scum!
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            var %bossexp2a $calc(%bossexp2 + 50)
            var %extracash2 $calc($readini(mnycount.ini,$nick,money) + 5000)
            writeini -n mnycount.ini $nick money $($+(%extracash2),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp2a),2)
            HALT
          }
        }
      }
    }
  }
  ;#####################################################################
  ;############################# LUCIUS
  ;######## RPG LEVEL 3 ######## LUCIUS
  ;############################# LUCIUS
  ;#####################################################################
  ; && ($chan != #Adultchat) 
  if (!%rpgflood. [ $+ [ $chan ] ]) && ($2 == evil3) && ($readini(mnycount.ini,$nick,EXP) > 600) && ($readini(mnycount.ini,$nick,EXP) < 1300) {
    if (!%replyflood. [ $+ [ $chan ] ]) {
      if ($readini(mnycount.ini,$nick,EXP) > 1245) {
        notice $nick 4You have beaten this level already. 
        HALT
      }
      set -u12 %replyflood. [ $+ [ $chan ] ] ON 
      set -u12 %rpgflood. [ $+ [ $chan ] ] ON
      var %chan3 $chan
      var %md3 $rand(1,17)
      ;--### Charm additions ###
      if ($readini(mnycount.ini,$nick,rpgcharm) == $null) { var %mkc3 1 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Loose Change) { var %mkc3 250 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Hoarding) { var %mkc3 400 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Fortuitous Fortunes) { var %mkc3 600 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Hunter) { var %mkc3 800 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Thieving) { var %mkc3 1000 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Trader) { var %mkc3 1200 }

      ;--### Armour additions ###
      if ($readini(mnycount.ini,$nick,rpgarmour) == $null) { var %mkw3 1 }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Leather) { var %mkw3 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hard Leather) { var %mka3 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Leather) { var %mka3 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Ring Mail) { var %mka3 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Mail) { var %mka3 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Steel Plate) { var %mka3 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hedge Knight) { var %mka3 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Horse Knight) { var %mka3 $rand(15,20) }

      ;--### Weapon additions ###
      if ($readini(mnycount.ini,$nick,rpgweapon) == $null) { var %mkw3 1 }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Staff) { var %mkw3 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Shortsword) { var %mkw3 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Spear) { var %mkw3 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Longsword) { var %mkw3 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Two-Handed Sword) { var %mkw3 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Fighting Axe) { var %mkw3 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Throwing Axe) { var %mkw3 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Twinblade Axe) { var %mkw3 $rand(15,20) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Halberd) { var %mkw3 $rand(18,23) }
      var %mk3 $calc(%mkw3 + %mka3 + $rand(1,35))

      var %rpgfight3 $calc($readini(mnycount.ini,$nick,FightNumber) + 1)
      writeini -n mnycount.ini $nick FightNumber $($+(%rpgfight3),2)
      ;########################################
      ;######## LVL 3 SPECIFIC BATTLE! ########
      ;########################################
      if ($readini(mnycount.ini,$nick,EXP) < 1190) {
        if (!%ONEfight3) {
          set -u4 %ONEfight3 on
          var %monsterloot3 $calc($rand(300,700) + %mkc3)
          var %killmoney3 $calc($readini(mnycount.ini,$nick,money) + %monsterloot3)
          var %EXP3 $rand(25,50)
          var %expearnt3 $calc($readini(mnycount.ini,$nick,EXP) + %EXP3)
          var %monster3 $read(monsters3.txt)
          var %meet31 7 $+ $nick 10is wandering through a 3forest10, meeting head on with :7 %monster3 $+ 7!!!
          var %meet32 7 $+ $nick 10comes to a clearing in the 3forest10, catching :7 %monster3  10unaware7!!!
          var %meet33 7 $+ $nick 10is in the depths of the 3forest10, when pounced by :7 %monster3 $+ 7!!!
          var %meet34 7 $+ $nick 10is deep in the thick 3forest10, stumbling over :7 %monster3 $+ 7!!!
          var %meet35 7 $+ $nick 10wanders on, shaded by huge 3trees10 and chancing upon :7 %monster3 10napping in the shade7!!!
          msg $chan %meet3 [ $+ [ $r(1,5) ] ]
          if (%md3 < %mk3) {  
            writeini -n mnycount.ini $nick EXP $($+(%expearnt3),2)
            writeini -n mnycount.ini $nick money $($+(%killmoney3),2)
            timer 1 4 msg %chan3 7 %monster3 10barely saw7 $nick 10before they attack and defeat it!4 %EXP3 EXP10 and gained3 %monsterloot3  C
            HALT
          }
          if (%md3 > %mk3) {
            timer 1 4 msg %chan3 7 %monster3 10managed to dissapear among the trees, this 3forest10 is tough. 
            HALT
          }
          if (%md3 == %mk3) {
            timer 1 5 msg %chan3 10OH NO7 $nick 10& the7 %monster3 10struck, smacked each other in the head, fell unconscious and slept off the pain side by side. 14(4!rpgstats14 for your details) 
            HALT
          }
        }
      }
      ;###############################
      ;######## BOSS BATTLE 3 ########
      ;###############################
      if ($readini(mnycount.ini,$nick,EXP) >= 1190) && ($readini(mnycount.ini,$nick,EXP) < 1245) { 
        if (!%ONEfight3) {
          set -u4 %ONEfight3 on
          msg $chan 4BOSS BATTLE!!! 10Deeper in The 3forest10 than7 $nick 10ever went before, they find a7 MaD WoOdcUtTeR4!!!  10He is looking rough but his axe glints in the dappled light!
          var %bossexp3 $calc($readini(mnycount.ini,$nick,EXP) + 175)
          var %response3 $rand(1,7)
          if (%response3 == 1) || (%response3 == 2) {
            timer 1 5 msg $chan 10The 7MaD WoOdcUtTeR10 attacks wildly!  You have no real weapon to defend you from his axe and raising your arm just left a bloody stump.
            timer 1 10 msg $chan 10You have lost an arm and are easily chopped up after that, dead in fact, until you try again and get healed miraculously...
            HALT 
          }
          if (%response3 == 3) {
            timer 1 5 msg $chan 10The 7MaD WoOdcUtTeR10 is much tougher than $nick expected.  Running when he almost cuts off your head, you head back to think up another plan.
            timer 1 10 msg $chan 4You lost 33000C4 where his blade tore a pocket but luckily thats all he struck. Try again.
            var %spent3 $calc($readini(mnycount.ini,$nick,money) - 1000)
            writeini -n mnycount.ini $nick money $($+(%spent3),2)
            HALT 
          } 
          if (%response3 == 4) || (%response3 == 5) {
            timer 1 5 msg $chan 7 $+ $nick 10is not quite the hero they wish to be... keeping out of range and dashing into the wide river that cutts through the 3forest10...
            timer 1 10 msg $chan 10The 7MaD WoOdcUtTeR10 hurls rocks and shouts incoherently, safety lies by making your way to the middle of the river to be swept along. 4 17510 EXP. 10Nobody said questing would be so scary... 
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp3),2)
            HALT
          }
          if (%response3 == 6) || (%response3 == 7) {
            timer 1 5 msg $chan 10stumbling back until halted by a tree,7 $nick 10sees madness and rage incarnate coming towards them...  Holding onto the inadequate paring knife taken from home.  
            timer 1 10 msg $chan 10Fury blinds the crazed man, he swings predictably, you duck as the axe meets the tree to your back and send the little knife deep into his ribs. 38000C10 he had hidden in his shack.4 300EXP 10gained for making the 3forest10 a safer place and you come to a river ahead.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            var %bossexp3a $calc(%bossexp3 + 125)
            var %extracash3 $calc($readini(mnycount.ini,$nick,money) + 8000)
            writeini -n mnycount.ini $nick money $($+(%extracash3),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp3a),2)
            HALT
          }
        }
      }
    }
  }
  ;############################################################
  ;############################# LUCIUS
  ;######## RPG LEVEL 4 ######## LUCIUS
  ;############################# LUCIUS
  ;############################################################
  ; && ($chan != #Adultchat)
  if (!%rpgflood. [ $+ [ $chan ] ]) && ($2 == evil4) && ($readini(mnycount.ini,$nick,EXP) > 1200) && ($readini(mnycount.ini,$nick,EXP) < 2200) {
    if ($readini(mnycount.ini,$nick,EXP) > 2100) {
      notice $nick 4You have beaten this level already. 
      HALT
    }
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u12 %replyflood. [ $+ [ $chan ] ] ON 
      set -u12 %rpgflood. [ $+ [ $chan ] ] ON
      var %chan4 $chan
      var %md4 $rand(1,15)
      ;--### Charm additions ###
      if ($readini(mnycount.ini,$nick,rpgcharm) == $null) { var %mkc4 1 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Loose Change) { var %mkc4 250 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Hoarding) { var %mkc4 400 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Fortuitous Fortunes) { var %mkc4 600 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Hunter) { var %mkc4 800 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Thieving) { var %mkc4 1000 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Trader) { var %mkc4 1200 }

      ;--### Armour additions ###
      if ($readini(mnycount.ini,$nick,rpgarmour) == $null) { var %mkw4 1 }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Leather) { var %mkw4 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hard Leather) { var %mka4 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Leather) { var %mka4 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Ring Mail) { var %mka4 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Mail) { var %mka4 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Steel Plate) { var %mka4 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hedge Knight) { var %mka4 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Horse Knight) { var %mka4 $rand(15,20) }

      ;--### Weapon additions ###
      if ($readini(mnycount.ini,$nick,rpgweapon) == $null) { var %mkw4 1 }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Staff) { var %mkw4 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Shortsword) { var %mkw4 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Spear) { var %mkw4 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Longsword) { var %mkw4 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Two-Handed Sword) { var %mkw4 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Fighting Axe) { var %mkw4 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Throwing Axe) { var %mkw4 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Twinblade Axe) { var %mkw4 $rand(15,20) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Halberd) { var %mkw4 $rand(18,23) }
      var %mk4 $calc(%mkw4 + %mka4 + $rand(1,30))

      var %rpgfight4 $calc($readini(mnycount.ini,$nick,FightNumber) + 1)
      writeini -n mnycount.ini $nick FightNumber $($+(%rpgfight4),2)
      ;########################################
      ;######## LVL 4 SPECIFIC BATTLE! ########
      ;########################################
      if ($readini(mnycount.ini,$nick,EXP) < 2000) {
        if (!%ONEfight4) {
          set -u4 %ONEfight4 on
          var %monsterloot4 $calc($rand(500,1000) + %mkc4)
          var %killmoney4 $calc($readini(mnycount.ini,$nick,money) + %monsterloot4)
          var %EXP4 $rand(40,65)
          var %expearnt4 $calc($readini(mnycount.ini,$nick,EXP) + %EXP4)
          var %monster4 $read(monsters4.txt)
          var %meet41 7 $+ $nick 10is drifting along a calm part of the 12river10, meeting head on with :7 %monster4 $+ 7!!!
          var %meet42 7 $+ $nick 10is racing in swift 12waters10, catching :7 %monster4  10unaware7!!!
          var %meet43 7 $+ $nick 10struggles in swirling 12rapids10 when attacked by :7 %monster4 $+ 7!!!
          var %meet44 7 $+ $nick 10is swimming past a lul in the 12river10's pace, knocking into :7 %monster4 $+ 7!!!
          var %meet45 7 $+ $nick 10fights the current at a split in the 12river10 and chances upon :7 %monster4 10looking for lunch7!!!
          msg %chan4 %meet4 [ $+ [ $r(1,5) ] ]
          if (%md4 < %mk4) {  
            writeini -n mnycount.ini $nick EXP $($+(%expearnt4),2)
            writeini -n mnycount.ini $nick money $($+(%killmoney4),2)
            var %win41 7 %monster4 10barely saw7 $nick 10before they attack and defeat it!4 %EXP4 EXP10 and gained3 %monsterloot4  C
            var %win42 10The7 %monster4 10was defeated with much bravery and heroism!7  $nick 10earned4 %EXP4 10EXP and looted3 %monsterloot4 $+ C
            var %win43 10A win! The7 %monster4 10didn't stand a chance.4 %EXP4 EXP10 and gained3 %monsterloot4  C
            timer 1 4 msg %chan4 %win4 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md4 > %mk4) {
            var %lose41 10 Running away was easier than fighting for 7 %monster4 $+ !!! 10It got away.
            var %lose42 7 %monster4 10vanished in a cloud of dirty water.
            var %lose43 7 %monster4 10managed to swim away, the 12river10 makes for easy get-aways.
            timer 1 4 msg %chan4 %lose4 [ $+ [ $r(1,3) ] ]

            HALT
          }
          if (%md4 == %mk4) {
            var %tied41 10OH NO7 $nick 10& the7 %monster4 10struck, smacked each other in the head, fell unconscious and drifted on downstream. 14(4!rpgstats14 for your details) 
            var %tied42 10OH NO7 $nick 10& the7 %monster4 4BOTH 10struck massive blows, stunning each other long enough that the river current swept them apart. 14(4!rpgstats14 for your details) 
            timer 1 5 msg %chan4 %tied4 [ $+ [ $r(1,2) ] ]
            HALT
          }
        }
      }
      ;###############################
      ;######## BOSS BATTLE 4 ########
      ;###############################
      if ($readini(mnycount.ini,$nick,EXP) >= 2000) && ($readini(mnycount.ini,$nick,EXP) < 2100) { 
        if (!%ONEfight4) {
          set -u4 %ONEfight4 on
          msg $chan 4BOSS BATTLE!!! 10Beyond the furthest reaches of the 12river7, $nick 10is suprised by an 7 Overgrown Squid4!!!  10All eight arms reach out for you!
          var %bossexp4 $calc($readini(mnycount.ini,$nick,EXP) + 250)
          var %response4 $rand(1,7)
          if (%response4 == 1) || (%response4 == 2) {
            timer 1 5 msg $chan 10The 7Overgrown Squid10 attacks with poison inkjets first! Sight goes black as you sink into the depths of the 12river10...
            timer 1 10 msg $chan 10You have lost consciousness as the creature drags you to the 12river10 bed, dead in fact, until you try again and get healed miraculously...
            HALT 
          }
          if (%response4 == 3) {
            timer 1 5 msg $chan 10The 7Overgrown Squid10 is much tougher than $nick expected.  Suction pads grip you all over but a lucky blow makes it let go and you climb a rock in the middle of the 12river10.
            timer 1 10 msg $chan 4You lost 35000C10 when you realise there's a missing part of your coat, the money pocket is gone. Try again.
            var %spent4 $calc($readini(mnycount.ini,$nick,money) - 5000)
            writeini -n mnycount.ini $nick money $($+(%spent4),2)
            HALT 
          } 
          if (%response4 == 4) || (%response4 == 5) {
            timer 1 5 msg $chan 7 $+ $nick 10is not quite the hero they wish to be... The imminent attack causes you to loose your bowels and urinate in fear...
            timer 1 10 msg $chan 10The 7Overgrown Squid10 confuses your terror for something like the inkjet attack and it flees the warm yellow water expanding around you.. 4 25010 EXP. 10You won the fight, but lost your dignity... 
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp4),2)
            HALT
          }
          if (%response4 == 6) || (%response4 == 7) {
            timer 1 5 msg $chan 10Your trusty paring knife has dispatched many foes by now and you bide your time to strike, letting it gather you and drag you underwater...
            timer 1 10 msg $chan 10Deeper you go, holding your breath until the moment comes and you delve the blade deep into it's eye and twist... 310000C10 is led down in the Squids den, among bones.4 450EXP 10gained for making the most of your little knife against the odds.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            var %bossexp4a $calc(%bossexp4 + 200)
            var %extracash4 $calc($readini(mnycount.ini,$nick,money) + 10000)
            writeini -n mnycount.ini $nick money $($+(%extracash4),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp4a),2)
            HALT
          }
        }
      }
    }
  }
  ;###############################################################
  ;############################# LUCIUS
  ;######## RPG LEVEL 5 ######## LUCIUS
  ;############################# LUCIUS
  ;###############################################################
  ; && ($chan != #Adultchat)
  if (!%rpgflood. [ $+ [ $chan ] ]) && ($2 == evil5) && ($readini(mnycount.ini,$nick,EXP) > 2100) {
    if ($readini(mnycount.ini,$nick,EXP) > 4100) {
      notice $nick 4You have beaten this level already. 
      HALT
    }
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u12 %replyflood. [ $+ [ $chan ] ] ON 
      set -u12 %rpgflood. [ $+ [ $chan ] ] ON
      var %chan5 $chan
      var %md5 $rand(1,15)
      ;--### Charm additions ###
      if ($readini(mnycount.ini,$nick,rpgcharm) == $null) { var %mkc5 1 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Loose Change) { var %mkc5 250 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Hoarding) { var %mkc5 400 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Fortuitous Fortunes) { var %mkc5 600 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Hunter) { var %mkc5 800 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Thieving) { var %mkc5 1000 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Trader) { var %mkc5 1200 }

      ;--### Armour additions ###
      if ($readini(mnycount.ini,$nick,rpgarmour) == $null) { var %mkw5 1 }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Leather) { var %mkw5 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hard Leather) { var %mka5 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Leather) { var %mka5 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Ring Mail) { var %mka5 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Mail) { var %mka5 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Steel Plate) { var %mka5 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hedge Knight) { var %mka5 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Horse Knight) { var %mka5 $rand(15,20) }

      ;--### Weapon additions ###
      if ($readini(mnycount.ini,$nick,rpgweapon) == $null) { var %mkw5 1 }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Staff) { var %mkw5 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Shortsword) { var %mkw5 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Spear) { var %mkw5 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Longsword) { var %mkw5 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Two-Handed Sword) { var %mkw5 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Fighting Axe) { var %mkw5 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Throwing Axe) { var %mkw5 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Twinblade Axe) { var %mkw5 $rand(15,20) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Halberd) { var %mkw5 $rand(18,23) }
      var %mk5 $calc(%mkw5 + %mka5 + $rand(1,30))

      var %rpgfight5 $calc($readini(mnycount.ini,$nick,FightNumber) + 1)
      writeini -n mnycount.ini $nick FightNumber $($+(%rpgfight5),2)
      ;########################################
      ;######## LVL 5 SPECIFIC BATTLE! ########
      ;########################################
      if ($readini(mnycount.ini,$nick,EXP) < 3950) {
        if (!%ONEfight5) {
          set -u4 %ONEfight5 on
          var %monsterloot5 $calc($rand(700,1200) + %mkc5)
          var %killmoney5 $calc($readini(mnycount.ini,$nick,money) + %monsterloot5)
          var %EXP5 $rand(55,90)
          var %expearnt5 $calc($readini(mnycount.ini,$nick,EXP) + %EXP5)
          var %monster5 $read(monsters5.txt)
          var %meet51 7 $+ $nick 10walks along beside the river, on a 14gravel road10, meeting head on with :7 %monster5 $+ 7!!!
          var %meet52 7 $+ $nick 10making their way alongside the river, 14gravel10 crunching underfoot and telling:7 %monster5  10of your approach7!!!
          var %meet53 7 $+ $nick 10follows the river on a 14gravel road10 that winds next to it,suddenly attacked by :7 %monster5 $+ 7!!!
          var %meet54 7 $+ $nick 10is travelling on a 14loose stone road10 when they trip and fall into a bush, knocking into :7 %monster5 $+ 7!!!
          var %meet55 7 $+ $nick 10heads down the 14gravel road10 and chances upon:7 %monster5 10looking for lunch7!!!
          msg %chan5 %meet5 [ $+ [ $r(1,5) ] ]
          if (%md5 < %mk5) {  
            writeini -n mnycount.ini $nick EXP $($+(%expearnt5),2)
            writeini -n mnycount.ini $nick money $($+(%killmoney5),2)
            var %win51 7 %monster5 10barely saw7 $nick 10before they attack and defeat it!4 %EXP5 EXP10 and gained3 %monsterloot5  C
            var %win52 10The7 %monster5 10was defeated with much bravery and heroism!7  $nick 10earned4 %EXP5 10EXP and looted3 %monsterloot5 $+ C
            var %win53 10A win! The7 %monster5 10didn't stand a chance.4 %EXP5 EXP10 and gained3 %monsterloot5  C
            timer 1 4 msg %chan5 %win5 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md5 > %mk5) {
            var %lose51 10 Running away was easier than fighting for 7 %monster5 $+ !!! 10It got away.
            var %lose52 7 %monster5 10vanished in a cloud of dust, kicked up by the fight.
            var %lose53 7 %monster5 10managed to dive into the river, the 12river10 makes for easy get-aways and besides, you've had enough of that stupid river.
            timer 1 4 msg %chan5 %lose5 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md5 == %mk5) {
            var %tied51 10OH NO7 $nick 10& the7 %monster5 10struck, smacked each other in the head, fell unconscious and drifted on downstream. 14(4!rpgstats14 for your details) 
            var %tied52 10OH NO7 $nick 10& the7 %monster5 4BOTH 10struck massive blows, stunning each other long enough that the river current swept them apart. 14(4!rpgstats14 for your details) 
            timer 1 5 msg %chan5 %tied5 [ $+ [ $r(1,2) ] ]
            HALT
          }
        }
      }
      ;###############################
      ;######## BOSS BATTLE 5 ########
      ;###############################
      if ($readini(mnycount.ini,$nick,EXP) >= 3950) && ($readini(mnycount.ini,$nick,EXP) < 4100) { 
        if (!%ONEfight5) {
          set -u4 %ONEfight5 on
          msg $chan 4BOSS BATTLE!!! 10The 12river10 and 14gravel road10 both dissapear into a city up ahead!7 $nick 10finds a7 DeRaNgEd FiShErMaN4!!!  10He blocks your path!
          var %bossexp5 $calc($readini(mnycount.ini,$nick,EXP) + 300)
          var %response5 $rand(1,7)
          if (%response5 == 1) || (%response5 == 2) {
            timer 1 5 msg $chan 10The 7DeRaNgEd FiShErMaN10 attacks with his fishing rod! The barbed hook sinks into your clothing and you are lifted from the 14gravel road10 to swing uselessly...
            timer 1 10 msg $chan 10You have lost. His rod uses steel coils to catch the monsters of the river and you have no chance of escape as he prepares to gut you...
            HALT 
          }
          if (%response5 == 3) {
            timer 1 5 msg $chan 10The 7DeRaNgEd FiShErMaN10 is much tougher than $nick expected.  he whips you over an over with the rod until you run away and drop your backpack, feeling a tug and knowing he has hooked it.
            timer 1 10 msg $chan 4You lost 37000C10 that was in the pack, along with all your supplies. Try again.
            var %spent5 $calc($readini(mnycount.ini,$nick,money) - 7000)
            writeini -n mnycount.ini $nick money $($+(%spent5),2)
            HALT 
          } 
          if (%response5 == 4) || (%response5 == 5) {
            timer 1 5 msg $chan 7 $+ $nick 10is not quite the hero they wish to be... The 7DeRaNgEd FiShErMaN10 chases you off the 14road10 into the river...
            timer 1 10 msg $chan 10You feel creatures knock into you repeatedly and freak out, flailing about in the water until screams behind you make you realise the monsters want the fisherman more.. 4 30010 EXP. 10You won the fight, strangely, and make your way into the city ahead.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp5),2)
            HALT
          }
          if (%response5 == 6) || (%response5 == 7) {
            timer 1 5 msg $chan 10Your trust paring knife is useless against a 12ft fishing rod and you think furiously, letting him swing as you back away off the road...
            timer 1 10 msg $chan 10Watching as you move among trees, you wait for his rod to be tangled in the branches. Lunging as the moment comes and stabbing repeatedly. 313000C10from him selling creature parts, was in the tackle box.4 555EXP 10gained for dispatching evil with your life-saving little knife.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            var %bossexp5a $calc(%bossexp5 + 255)
            var %extracash5 $calc($readini(mnycount.ini,$nick,money) + 13000)
            writeini -n mnycount.ini $nick money $($+(%extracash5),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp5a),2)
            HALT
          }
        }
      }
    }
  }
  ;########################################################
  ;#############################
  ;######## RPG LEVEL 6 ########
  ;#############################
  ;########################################################
  ; && ($chan != #Adultchat)
  if (!%rpgflood. [ $+ [ $chan ] ]) && ($2 == evil6) && ($readini(mnycount.ini,$nick,EXP) > 4190) {
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u12 %replyflood. [ $+ [ $chan ] ] ON 
      set -u12 %rpgflood. [ $+ [ $chan ] ] ON
      var %chan6 $chan
      var %md6 $rand(6,25)
      if ($readini(mnycount.ini,$nick,EXP) > 6500) {
        notice $nick 4You have beaten this level already. 
        HALT
      }
      ;--### Charm additions ###
      if ($readini(mnycount.ini,$nick,rpgcharm) == $null) { var %mkc6 1 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Loose Change) { var %mkc6 250 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Hoarding) { var %mkc6 400 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Fortuitous Fortunes) { var %mkc6 600 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Hunter) { var %mkc6 800 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Thieving) { var %mkc6 1000 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Trader) { var %mkc6 1200 }

      ;--### Armour additions ###
      if ($readini(mnycount.ini,$nick,rpgarmour) == $null) { var %mkw6 1 }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Leather) { var %mkw6 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hard Leather) { var %mka6 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Leather) { var %mka6 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Ring Mail) { var %mka6 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Mail) { var %mka6 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Steel Plate) { var %mka6 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hedge Knight) { var %mka6 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Horse Knight) { var %mka6 $rand(15,20) }

      ;--### Weapon additions ###
      if ($readini(mnycount.ini,$nick,rpgweapon) == $null) { var %mkw6 1 }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Staff) { var %mkw6 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Shortsword) { var %mkw6 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Spear) { var %mkw6 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Longsword) { var %mkw6 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Two-Handed Sword) { var %mkw6 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Fighting Axe) { var %mkw6 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Throwing Axe) { var %mkw6 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Twinblade Axe) { var %mkw6 $rand(15,20) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Halberd) { var %mkw6 $rand(18,23) }
      var %mk6 $calc(%mkw6 + %mka6 + $rand(1,25))
      var %rpgfight6 $calc($readini(mnycount.ini,$nick,FightNumber) + 1)
      writeini -n mnycount.ini $nick FightNumber $($+(%rpgfight6),2)
      ;########################################
      ;######## LVL 6 SPECIFIC BATTLE! ########
      ;########################################
      if ($readini(mnycount.ini,$nick,EXP) < 6300) {
        if (!%ONEfight6) {
          set -u4 %ONEfight6 on
          var %monsterloot6 $calc($rand(700,1200) + %mkc6)
          var %killmoney6 $calc($readini(mnycount.ini,$nick,money) + %monsterloot6)
          var %EXP6 $rand(50,100)
          var %expearnt6 $calc($readini(mnycount.ini,$nick,EXP) + %EXP6)
          var %monster6 $read(monsters6.txt)
          var %meet61 7 $+ $nick 10walks along the city streets meeting head on with :7 %monster6 $+ 7!!!
          var %meet62 7 $+ $nick 10makes their way down a side ally, they kick a tin can telling:7 %monster6  10of your approach7!!!
          var %meet63 7 $+ $nick 10turns the corner on a dark street,suddenly attacked by :7 %monster6 $+ 7!!!
          var %meet64 7 $+ $nick 10wanders around, looking at the sights, knocking into :7 %monster6 $+ 7!!!
          var %meet65 7 $+ $nick 10walks into an empty shop and chances upon :7 %monster6 10with evil gaze7!!!
          msg %chan6 %meet6 [ $+ [ $r(1,5) ] ]
          echo -a Player %mk6 {[lvl6]} %md6 Monster
          if (%md6 < %mk6) {  
            writeini -n mnycount.ini $nick EXP $($+(%expearnt6),2)
            writeini -n mnycount.ini $nick money $($+(%killmoney6),2)
            var %win61 7 %monster6 10was doomed before they began7 $nick 10attacks and defeats it!4 %EXP6 EXP10 and gained3 %monsterloot6  C
            var %win62 10The7 %monster6 10was defeated like a questing hero only can!7  $nick 10earned4 %EXP6 EXP10 and looted3 %monsterloot6 $+ C
            var %win63 10You are VICTORIOUS! The7 %monster6 10didn't last long.4 %EXP6 EXP10 and gained3 %monsterloot6  C
            timer 1 4 msg %chan6 %win6 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md6 > %mk6) {
            var %lose61 10 Running away was easier than fighting for 7 %monster6 $+ !!!  
            var %lose62 7 %monster6 10ran off down a sidestreet!
            var %lose63 7 %monster6 10managed to dive over a wall, the 14City 10makes for easy hiding.
            timer 1 4 msg %chan6 %lose6 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md6 == %mk6) {
            var %sleepmoney6 $rand(500,2000)
            var %sleepmoneyz6 $calc($readini(mnycount.ini,$nick,money) - %sleepmoney6)
            var %tied61 10OH NO7 $nick 10& the7 %monster6 10struck, smacked each other in the head, fell unconscious. 10It got away and you lost some coins in the confusion. 3 %sleepmoney6 $+ C10 Lost. 14(4!rpgstats14 for your details) 
            var %tied62 10OH NO7 $nick 10& the7 %monster6 4BOTH 10struck massive blows and drop to the gound in a daze. 10It got away and you lost some coins in the confusion. 3 %sleepmoney6 $+ C10 Lost. 14(4!rpgstats14 for your details) 
            timer 1 5 msg %chan6 %tied6 [ $+ [ $r(1,2) ] ]
            writeini -n mnycount.ini $nick money $($+(%sleepmoneyz6),2)
            HALT
          }
        }
      }
      ;###############################
      ;######## BOSS BATTLE 6 ########
      ;###############################
      if ($readini(mnycount.ini,$nick,EXP) >= 6300) && ($readini(mnycount.ini,$nick,EXP) < 6500) { 
        if (!%ONEfight6) {
          set -u4 %ONEfight6 on
          msg %chan6 4BOSS BATTLE!!!!7 $nick 10finds a7 MaNiAC MeRcEnArY!!!  10He stumbles out of an Alehouse and pulls his sword!
          var %bossexp6 $calc($readini(mnycount.ini,$nick,EXP) + 400)
          var %response6 $rand(1,7)
          if (%response6 == 1) || (%response6 == 2) {
            timer 1 5 msg %chan6 10The 7MaNiAC MeRcEnArY10 attacks with his sword! The drunked state of him doesn't slow him down much...
            timer 1 10 msg %chan6 10You have been dismembered easily by the sharp blade, it's too soon to fight a real killer but you'll have to try again....
            HALT 
          }
          if (%response6 == 3) {
            timer 1 5 msg %chan6 10The 7MaNiAC MeRcEnArY10 is much tougher than $nick expected.  He slices your clothes in a drunken stupor until you run away and your backpack is cut from your back.
            timer 1 10 msg %chan6 4You lost 310,000C10 that was in the pack, along with all your supplies. Try again.
            var %spent6 $calc($readini(mnycount.ini,$nick,money) - 10000)
            writeini -n mnycount.ini $nick money $($+(%spent6),2)
            HALT 
          } 
          if (%response6 == 4) || (%response6 == 5) {
            timer 1 5 msg %chan6 7 $+ $nick 10is not quite the hero they wish to be... The 7MaNiAC MeRcEnArY10 chases you down the street and corners you at a dead end...
            timer 1 10 msg %chan6 10You plead for your life but he doesn't listen, then suddenly he has a sword sprouting out of his back.. 4 40010 EXP. 10You won with the aid of the City Watch.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp6),2)
            HALT
          }
          if (%response6 == 6) || (%response6 == 7) {
            timer 1 5 msg %chan6 10You goad him and then turn to run as he comes racing after you, swinging his sword in rage...
            timer 1 10 msg %chan6 10You grab a lamp post as he closes in, swinging around it and attacking suddenly, suprising him with your weapon embedded into his face. 315000C10from the dead merc's pockets.4 600EXP 10gained for dispatching an evil sellsword.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            var %bossexp6a $calc(%bossexp6 + 200)
            var %extracash6 $calc($readini(mnycount.ini,$nick,money) + 15000)
            writeini -n mnycount.ini $nick money $($+(%extracash6),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp6a),2)
            HALT
          }
        }
      }
    }
  }
  ;########################################################
  ;#############################
  ;######## RPG LEVEL 7 ########
  ;#############################
  ;########################################################
  if (!%rpgflood. [ $+ [ $chan ] ]) && ($2 == evil7) && ($readini(mnycount.ini,$nick,EXP) > 6400) {
    if ($readini(mnycount.ini,$nick,EXP) > 10200) {
      notice $nick 4You have beaten this level already. 
      HALT
    }
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u12 %replyflood. [ $+ [ $chan ] ] ON 
      set -u12 %rpgflood. [ $+ [ $chan ] ] ON
      var %chan7 $chan
      var %md7 $rand(6,29)
      ;--### Charm additions ###
      if ($readini(mnycount.ini,$nick,rpgcharm) == $null) { var %mkc7 1 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Loose Change) { var %mkc7 250 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Hoarding) { var %mkc7 400 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Fortuitous Fortunes) { var %mkc7 600 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Hunter) { var %mkc7 800 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Thieving) { var %mkc7 1000 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Trader) { var %mkc7 1200 }

      ;--### Armour additions ###
      if ($readini(mnycount.ini,$nick,rpgarmour) == $null) { var %mkw7 1 }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Leather) { var %mkw7 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hard Leather) { var %mka7 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Leather) { var %mka7 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Ring Mail) { var %mka7 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Mail) { var %mka7 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Steel Plate) { var %mka7 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hedge Knight) { var %mka7 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Horse Knight) { var %mka7 $rand(15,20) }

      ;--### Weapon additions ###
      if ($readini(mnycount.ini,$nick,rpgweapon) == $null) { var %mkw7 1 }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Staff) { var %mkw7 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Shortsword) { var %mkw7 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Spear) { var %mkw7 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Longsword) { var %mkw7 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Two-Handed Sword) { var %mkw7 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Fighting Axe) { var %mkw7 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Throwing Axe) { var %mkw7 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Twinblade Axe) { var %mkw7 $rand(15,20) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Halberd) { var %mkw7 $rand(18,23) }

      var %mk7 $calc(%mkw7 + %mka7 + $rand(1,22))
      var %rpgfight7 $calc($readini(mnycount.ini,$nick,FightNumber) + 1)
      writeini -n mnycount.ini $nick FightNumber $($+(%rpgfight7),2)
      ;########################################
      ;######## LVL 7 SPECIFIC BATTLE! ########
      ;########################################
      if ($readini(mnycount.ini,$nick,EXP) < 10000) {
        if (!%ONEfight7) {
          set -u4 %ONEfight7 on
          var %monsterloot7 $calc($rand(700,1200) + %mkc7)
          var %killmoney7 $calc($readini(mnycount.ini,$nick,money) + %monsterloot7)
          var %EXP7 $calc($rand(70,100) + %mka7 + %mkw7)
          var %expearnt7 $calc($readini(mnycount.ini,$nick,EXP) + %EXP7)
          var %monster7 $read(monsters7.txt)
          var %meet71 7 $+ $nick 10walks along the 10sewers10 beneath the city streets, meeting head on with :7 %monster7 $+ 7!!!
          var %meet72 7 $+ $nick 10makes their way down a slanted 10waste pipe10, the splashing tells:7 %monster7  10of your approach7!!!
          var %meet73 7 $+ $nick 10wades through waist deep 10sludge10,suddenly attacked by :7 %monster7 $+ 7!!!
          var %meet74 7 $+ $nick 10wanders, stumbling through a dark and dank 10sewer pipe10, knocking into :7 %monster7 $+ 7!!!
          var %meet75 7 $+ $nick 10is heading through 10sewers10 looking for an underground entrance but finds:7 %monster7 10with evil gaze7!!!
          msg %chan7 %meet7 [ $+ [ $r(1,5) ] ]
          echo -a Player = %mk7 {|} %md7 = Monster
          if (%md7 < %mk7) {  
            writeini -n mnycount.ini $nick EXP $($+(%expearnt7),2)
            writeini -n mnycount.ini $nick money $($+(%killmoney7),2)
            var %win71 7 %monster7 10was doomed before they began7 $nick 10attacks and defeats it!4 %EXP7 EXP10 and gained3 %monsterloot7  C
            var %win72 7 %monster7 10floats away dead, joining the rest of the waste.7  $nick 10earned4 %EXP7 EXP10 and looted3 %monsterloot7 $+ C
            var %win73 10The smell of victory is a lot like piles of crap right now.. The7 %monster7 10died and sank beneath the sludge.4 %EXP7 EXP10 and gained3 %monsterloot7  C
            timer 1 4 msg %chan7 %win7 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md7 > %mk7) {
            var %lose71 7 %monster7 10kicked something rotten in your face and escapes while you retch!!!  
            var %lose72 7 %monster7 10ran off down a sewage outlet!
            var %lose73 7 %monster7 10managed to dive into the sewage and vanish.
            timer 1 4 msg %chan7 %lose7 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md7 == %mk7) {
            var %sleepmoney7 $rand(500,2000)
            var %sleepmoneyz7 $calc($readini(mnycount.ini,$nick,money) - %sleepmoney7)
            var %tied71 10OH NO7 $nick 10& the7 %monster7 10struck, smacked each other in the head, fell unconscious . 10It got away and you lost some coins among the waste. 3 %sleepmoney7 $+ C10 Lost. 14(4!rpgstats14 for your details) 
            var %tied72 10OH NO7 $nick 10& the7 %monster7 4BOTH 10struck massive blows and drop to the gound in a daze among the detritus. 10It stole from you and left you stunned! 3 %sleepmoney7 $+ C10 Lost. 14(4!rpgstats14 for your details) 
            timer 1 5 msg %chan7 %tied7 [ $+ [ $r(1,2) ] ]
            writeini -n mnycount.ini $nick money $($+(%sleepmoneyz7),2)
            HALT
          }
        }
      }
      ;###############################
      ;######## BOSS BATTLE 7 ########
      ;###############################
      if ($readini(mnycount.ini,$nick,EXP) >= 10000) && ($readini(mnycount.ini,$nick,EXP) < 10200) { 
        if (!%ONEfight7) {
          set -u4 %ONEfight7 on
          msg %chan7 4BOSS BATTLE!!!!7 $nick 10finds a7 NeCrOpHiLiAc NeCrOmAnCeR!!!  10He is guarding the route that leads from sewer to graveyard!
          var %bossexp7 $calc($readini(mnycount.ini,$nick,EXP) + 400)
          var %response7 $rand(1,7)
          if (%response7 == 1) || (%response7 == 2) {
            timer 1 5 msg %chan7 10The 7NeCrOpHiLiAc NeCrOmAnCeR10 summons a zombie! The mindless creature is slow but you have to get past it...
            timer 1 10 msg %chan7 10Slow does not mean weak, you find as you thrust your weapon through it's rotten guts. It just growls, grips your head and squeezes until your skull caves in.4 You Die.10 Try again....
            HALT 
          }
          if (%response7 == 3) {
            timer 1 5 msg %chan7 10The 7NeCrOpHiLiAc NeCrOmAnCeR10 knocks you on the head, strips you and goes back to evil summonings. He thinks you are dead.
            timer 1 10 msg %chan7 4You lost 310,000C10 and all your clothes as you wriggle back the way you came before he finishes you off. Try again.
            var %spent7 $calc($readini(mnycount.ini,$nick,money) - 10000)
            writeini -n mnycount.ini $nick money $($+(%spent7),2)
            HALT 
          } 
          if (%response7 == 4) || (%response7 == 5) {
            timer 1 5 msg %chan7 7 $+ $nick 10is not quite the hero they wish to be... The 7NeCrOpHiLiAc NeCrOmAnCeR10 summons a zombie in haste, it comes bursting out of the floor!
            timer 1 10 msg %chan7 10Thinking you are done for you just stand there in shock as the creature turns on it's master! 4 400 EXP10. 10You won with the aid of a flawed summoning.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp7),2)
            HALT
          }
          if (%response7 == 6) || (%response7 == 7) {
            timer 1 5 msg %chan7 10As the evil arts need to be summoned, you leap in quickly before the incantation is finished but the zombie hand grips your ankle out of the floor...
            timer 1 10 msg %chan7 10You fall forwards into a table of potions and knock them flying, your ankle is released and screams come from the 7NeCrOpHiLiAc NeCrOmAnCeR10 as the broken bottles burst into flames all over him. 315000C10 was untouched by the inferno.4 600 EXP 10gained.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            var %bossexp7a $calc(%bossexp7 + 200)
            var %extracash7 $calc($readini(mnycount.ini,$nick,money) + 15000)
            writeini -n mnycount.ini $nick money $($+(%extracash7),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp7a),2)
            HALT
          }
        }
      }
    }
  }
  ;#########################################################
  ;############################# LUCIUS
  ;######## RPG LEVEL 8 ######## LUCIUS
  ;############################# LUCIUS
  ;#########################################################
  if (!%rpgflood. [ $+ [ $chan ] ]) && ($2 == evil8) && ($readini(mnycount.ini,$nick,EXP) > 10301) {
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u12 %replyflood. [ $+ [ $chan ] ] ON 
      set -u12 %rpgflood. [ $+ [ $chan ] ] ON
      var %chan8 $chan
      var %md8 $rand(10,38)
      if ($readini(mnycount.ini,$nick,EXP) > 16000) {
        notice $nick 4You have beaten this level already. 
        HALT
      }
      ;--### Charm additions ###
      if ($readini(mnycount.ini,$nick,rpgcharm) == $null) { var %mkc8 1 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Loose Change) { var %mkc8 250 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Hoarding) { var %mkc8 400 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Fortuitous Fortunes) { var %mkc8 600 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Hunter) { var %mkc8 800 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Thieving) { var %mkc8 1000 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Trader) { var %mkc8 1200 }

      ;--### Armour additions ###
      if ($readini(mnycount.ini,$nick,rpgarmour) == $null) { var %mkw8 1 }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Leather) { var %mkw8 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hard Leather) { var %mka8 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Leather) { var %mka8 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Ring Mail) { var %mka8 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Mail) { var %mka8 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Steel Plate) { var %mka8 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hedge Knight) { var %mka8 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Horse Knight) { var %mka8 $rand(15,20) }

      ;--### Weapon additions ###
      if ($readini(mnycount.ini,$nick,rpgweapon) == $null) { var %mkw8 1 }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Staff) { var %mkw8 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Shortsword) { var %mkw8 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Spear) { var %mkw8 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Longsword) { var %mkw8 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Two-Handed Sword) { var %mkw8 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Fighting Axe) { var %mkw8 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Throwing Axe) { var %mkw8 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Twinblade Axe) { var %mkw8 $rand(15,20) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Halberd) { var %mkw8 $rand(18,23) }

      var %mk8 $calc(%mkw8 + %mka8 + $rand(1,22))
      var %rpgfight8 $calc($readini(mnycount.ini,$nick,FightNumber) + 1)
      writeini -n mnycount.ini $nick FightNumber $($+(%rpgfight8),2)
      ;########################################
      ;######## LVL 8 SPECIFIC BATTLE! ########
      ;########################################
      if ($readini(mnycount.ini,$nick,EXP) < 15850) {
        if (!%ONEfight8) {
          set -u4 %ONEfight8 on
          var %monsterloot8 $calc($rand(700,1200) + %mkc8)
          var %killmoney8 $calc($readini(mnycount.ini,$nick,money) + %monsterloot8)
          var %EXP8 $calc($rand(70,100) + %mka8 + %mkw8)
          var %expearnt8 $calc($readini(mnycount.ini,$nick,EXP) + %EXP8)
          var %monster8 $read(monsters8.txt)
          var %meet81 7 $+ $nick 10walks through a 14graveyard10 inside the 14Castle keep10, meeting head on with :7 %monster8 $+ 7!!!
          var %meet82 7 $+ $nick 10makes their way between Lords 14graves10, rustling leaves warn:7 %monster8  10of your approach7!!!
          var %meet83 7 $+ $nick 10stumbles next to a 14mausoleum10, suddenly attacked by :7 %monster8 $+ 7!!!
          var %meet84 7 $+ $nick 10wanders in the solemn air of the 14Castle graveyard10,  knocking into :7 %monster8 $+ 7!!!
          var %meet85 7 $+ $nick 10is looking up at the castle, forgetting to watch their step when they fall into an 14open grave-pit10 finding:7 %monster8 10at the bottom7!!!
          msg %chan8 %meet8 [ $+ [ $r(1,5) ] ]
          echo -a Player = %mk8 {|} %md8 = Monster
          if (%md8 < %mk8) {  
            writeini -n mnycount.ini $nick EXP $($+(%expearnt8),2)
            writeini -n mnycount.ini $nick money $($+(%killmoney8),2)
            var %win81 7 %monster8 10was doomed before they began7 $nick 10attacks and defeats it!4 %EXP8 EXP10 and gained3 %monsterloot8  C
            var %win82 7 %monster8 10joins the dead, their corpse among the 14graves10.7  $nick 10earned4 %EXP8 EXP10 and looted3 %monsterloot8 $+ C
            var %win83 10The7 %monster8 10died quickly, it's almost as if death lingers here.4 %EXP8 EXP10 and gained3 %monsterloot8  C
            timer 1 4 msg %chan8 %win8 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md8 > %mk8) {
            var %lose81 7 %monster8 10vanished among the14 mausoleums10 and14 graves10, not wishing to join the many corpses already here.  
            var %lose82 10You catch your foot on a 14gravestone10 and 7 %monster8 10escapes!
            var %lose83 7 %monster8 10managed to get away so you continue for the 14Castle10 itself.
            timer 1 4 msg %chan8 %lose8 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md8 == %mk8) {
            var %sleepmoney8 $rand(500,2000)
            var %sleepmoneyz8 $calc($readini(mnycount.ini,$nick,money) - %sleepmoney8)
            var %tied81 10OH NO7 $nick 10& the7 %monster8 10struck, smacked each other in the head, fell unconscious . 10It got away and you lost some coins among the waste. 3 %sleepmoney8 $+ C10 Lost. 14(4!rpgstats14 for your details) 
            var %tied82 10OH NO7 $nick 10& the7 %monster8 4BOTH 10struck massive blows and drop to the gound as if 14graveyard10 has grown in population. 10It stole3 %sleepmoney8 $+ C10 14(4!rpgstats14 for your details) 
            timer 1 5 msg %chan8 %tied8 [ $+ [ $r(1,2) ] ]
            writeini -n mnycount.ini $nick money $($+(%sleepmoneyz8),2)
            HALT
          }
        }
      }
      ;###############################
      ;######## BOSS BATTLE 8 ########
      ;###############################
      if ($readini(mnycount.ini,$nick,EXP) >= 15850) && ($readini(mnycount.ini,$nick,EXP) < 16000) { 
        if (!%ONEfight8) {
          set -u4 %ONEfight8 on
          msg %chan8 4BOSS BATTLE!!!!7 $nick 10comes face to face with7 Kingly Ghost!!!  10The spirit is hovering over the entrance to the 14Castle10!
          var %bossexp8 $calc($readini(mnycount.ini,$nick,EXP) + 400)
          var %response8 $rand(1,7)
          if (%response8 == 1) || (%response8 == 2) {
            timer 1 5 msg %chan8 10The 7Kingly Ghost10 drifts towards you, dementia can be see in his eyes, as well as the doorway behind...
            timer 1 10 msg %chan8 10Thinking the ghost is harmless you walk right through him and become possessed! He makes you turn your weapon on yourself.4 You Die.10 Try again....
            HALT 
          }
          if (%response8 == 3) {
            timer 1 5 msg %chan8 10Kingly Ghost10 floats to you, then posseses your body! He makes you walk into the castle and slap a guard in the face.
            timer 1 10 msg %chan8 4You lost 310,000C10 for bail money and making apologies to the guard. Try again.
            var %spent8 $calc($readini(mnycount.ini,$nick,money) - 10000)
            writeini -n mnycount.ini $nick money $($+(%spent8),2)
            HALT 
          } 
          if (%response8 == 4) || (%response8 == 5) {
            timer 1 5 msg %chan8 7 $+ $nick 10is not quite the hero they wish to be... The 7Kingly Ghost10 pauses as you plead for permission to pass...
            timer 1 10 msg %chan8 10Thinking you are pathetic, he vanishes and lets you continue on your quest! 4 400 EXP10. 10You won, in a way. Onward into the 14Castle10!
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp8),2)
            HALT
          }
          if (%response8 == 6) || (%response8 == 7) {
            timer 1 5 msg %chan8 10You greet the 7Kingly Ghost10 with respect and explain your quest to him, hoping the demented look in his eyes is only the glaze of death...
            timer 1 10 msg %chan8 10You pursuaded the 7Kingly Ghost10 and he offers to help you on your quest! He shows you his 14mausoleum10 and tells you to take the gold he was buried with. 320000C10 was in his grave.4 600 EXP 10gained.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            var %bossexp8a $calc(%bossexp8 + 200)
            var %extracash8 $calc($readini(mnycount.ini,$nick,money) + 20000)
            writeini -n mnycount.ini $nick money $($+(%extracash8),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp8a),2)
            HALT
          }
        }
      }
    }
  }
  ; if ($chan != #Adultchat)
  ;#########################################################
  ;############################# LUCIUS
  ;######## RPG LEVEL 9 ######## LUCIUS
  ;############################# LUCIUS
  ;#########################################################
  if (!%rpgflood. [ $+ [ $chan ] ]) && ($2 == evil9) && ($readini(mnycount.ini,$nick,EXP) >= 16000) && ($readini(mnycount.ini,$nick,EXP) < 19000) {
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u12 %replyflood. [ $+ [ $chan ] ] ON 
      set -u12 %rpgflood. [ $+ [ $chan ] ] ON
      var %chan9 $chan
      var %md9 $rand(12,40)
      if ($readini(mnycount.ini,$nick,EXP) > 19000) {
        notice $nick 4You have beaten this level already. 
        HALT
      }
      ;--### Charm additions ###
      if ($readini(mnycount.ini,$nick,rpgcharm) == $null) { var %mkc9 1 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Loose Change) { var %mkc9 250 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Hoarding) { var %mkc9 400 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Fortuitous Fortunes) { var %mkc9 600 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Hunter) { var %mkc9 800 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Thieving) { var %mkc9 1000 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Trader) { var %mkc9 1200 }

      ;--### Armour additions ###
      if ($readini(mnycount.ini,$nick,rpgarmour) == $null) { var %mkw9 1 }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Leather) { var %mkw9 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hard Leather) { var %mka9 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Leather) { var %mka9 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Ring Mail) { var %mka9 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Mail) { var %mka9 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Steel Plate) { var %mka9 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hedge Knight) { var %mka9 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Horse Knight) { var %mka9 $rand(15,20) }

      ;--### Weapon additions ###
      if ($readini(mnycount.ini,$nick,rpgweapon) == $null) { var %mkw9 1 }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Staff) { var %mkw9 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Shortsword) { var %mkw9 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Spear) { var %mkw9 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Longsword) { var %mkw9 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Two-Handed Sword) { var %mkw9 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Fighting Axe) { var %mkw9 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Throwing Axe) { var %mkw9 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Twinblade Axe) { var %mkw9 $rand(15,20) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Halberd) { var %mkw9 $rand(18,23) }

      var %mk9 $calc(%mkw9 + %mka9 + $rand(1,22))
      var %rpgfight9 $calc($readini(mnycount.ini,$nick,FightNumber) + 1)
      writeini -n mnycount.ini $nick FightNumber $($+(%rpgfight9),2)
      ;########################################
      ;######## LVL 9 SPECIFIC BATTLE! ########
      ;########################################
      if ($readini(mnycount.ini,$nick,EXP) < 18850) {
        if (!%ONEfight9) {
          set -u4 %ONEfight9 on
          var %monsterloot9 $calc($rand(700,1200) + %mkc9)
          var %killmoney9 $calc($readini(mnycount.ini,$nick,money) + %monsterloot9)
          var %EXP9 $calc($rand(70,100) + %mka9 + %mkw9)
          var %expearnt9 $calc($readini(mnycount.ini,$nick,EXP) + %EXP9)
          var %monster9 $read(monsters9.txt)
          var %meet91 7 $+ $nick 10walks inside the 14Castle keep10, meeting head on with :7 %monster9 $+ 7!!!
          var %meet92 7 $+ $nick 10makes their way through a corridor, nudging a suit of armour:7 %monster9  10hears the noise7!!!
          var %meet93 10wandering the expensively furnished rooms,7 $nick 10is attacked by :7 %monster9 $+ 7!!!
          var %meet94 7 $+ $nick 10is looking around the 14Castle10,  and spots :7 %monster9 $+ 7!!!
          var %meet95 7 $+ $nick $+ 10, unsure if they have walked this route before, finds:7 %monster9 10waiting for them7!!!
          msg %chan9 %meet9 [ $+ [ $r(1,5) ] ]
          echo -a Player = %mk9 {|} %md9 = Monster
          if (%md9 < %mk9) {  
            writeini -n mnycount.ini $nick EXP $($+(%expearnt9),2)
            writeini -n mnycount.ini $nick money $($+(%killmoney9),2)
            var %win91 7 %monster9 10was doomed before they began7 $nick 10attacks and defeats it!4 %EXP9 EXP10 and gained3 %monsterloot9 $+ C
            var %win92 7 %monster9 10was slain and7 $nick 10earned4 %EXP9 EXP10 and looted3 %monsterloot9 $+ C
            var %win93 10The7 %monster9 10died quickly and7 $nick 10continues into the 14Castle10.4 %EXP9 EXP10 and gained3 %monsterloot9  C
            timer 1 4 msg %chan9 %win9 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md9 > %mk9) {
            var %lose91 7 %monster9 10vanished in the 14Castle10, hunting easier prey.  
            var %lose92 10You catch your foot on a pedestal and 7 %monster9 10escapes!
            var %lose93 7 %monster9 10managed to get away so you continue, looking for the 14Castle10 Lord.
            timer 1 4 msg %chan9 %lose9 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md9 == %mk9) {
            var %sleepmoney9 $rand(500,2000)
            var %sleepmoneyz9 $calc($readini(mnycount.ini,$nick,money) - %sleepmoney9)
            var %tied91 10OH NO7 $nick 10& the7 %monster9 10struck, smacked each other in the head, fell unconscious . 10It got away and you lost some coins among the waste. 3 %sleepmoney9 $+ C10 Lost. 14(4!rpgstats14 for your details) 
            var %tied92 10OH NO7 $nick 10& the7 %monster9 4BOTH 10struck massive blows and drop to the stone ground. When you wake your money has shrunk! Someone stole3 %sleepmoney9 $+ C10 14(4!rpgstats14 for your details) 
            timer 1 5 msg %chan9 %tied9 [ $+ [ $r(1,2) ] ]
            writeini -n mnycount.ini $nick money $($+(%sleepmoneyz9),2)
            HALT
          }
        }
      }
      ;###############################
      ;######## BOSS BATTLE 9 ########
      ;###############################
      if ($readini(mnycount.ini,$nick,EXP) >= 18850) && ($readini(mnycount.ini,$nick,EXP) < 19000) { 
        if (!%ONEfight9) {
          set -u4 %ONEfight9 on
          msg %chan9 4BOSS BATTLE!!!!7 $nick 10comes face to face with7 Lords Assistant!!!  10The sneer on his face as he approaches can't be a good sign.
          var %bossexp9 $calc($readini(mnycount.ini,$nick,EXP) + 400)
          var %response9 $rand(1,5)
          if (%response9 == 1) {
            timer 1 5 msg %chan9 10The 7Lords Assistant10 walks towards you, taking in your attire. Before he speaks, you know he is going to throw you out...
            timer 1 10 msg %chan9 10You tell him you have to speak to the Lord of the 14Castle10 but he doesn't listen, until you pull out some money. 310,000C10 Lost to Bribe him. 4 40010 EXP.
            var %spent9 $calc($readini(mnycount.ini,$nick,money) - 10000)
            writeini -n mnycount.ini $nick money $($+(%spent9),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp9),2)
            HALT 
          } 
          if (%response9 == 2) || (%response9 == 3) {
            timer 1 5 msg %chan9 7 $+ $nick 10is not quite the hero they wish to be... The 7Lords Assistant10 pauses as you plead for permission to see the 14Castle10 Lord...
            timer 1 10 msg %chan9 10Thinking you are pathetic, he turns and beckons you to follow! 4 400 EXP10. 10Next stop: The Lord of the 14Castle10!
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp9),2)
            HALT
          }
          if (%response9 == 4) || (%response9 == 5) {
            timer 1 5 msg %chan9 10You greet the 7Lords Assistant10 with respect and explain your quest to him, hoping the sneer is his natural face and not just for you...
            timer 1 10 msg %chan9 10The 7Lords Assistant10 offers to help you on your quest! He leads you through the maze of the 14Castle10 and gives you a bag of money. 320000C10 was added to your funds!4 400 EXP 10gained.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            var %bossexp9a $calc(%bossexp9 + 1)
            var %extracash9 $calc($readini(mnycount.ini,$nick,money) + 20000)
            writeini -n mnycount.ini $nick money $($+(%extracash9),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp9a),2)
            HALT
          }
        }
      }
    }
  }
  ; if ($chan != #Adultchat)
  ;#########################################################
  ;############################## LUCIUS
  ;######## RPG LEVEL 10 ######## LUCIUS
  ;############################## LUCIUS
  ;#########################################################
  if (!%rpgflood. [ $+ [ $chan ] ]) && ($2 == evil10) && ($readini(mnycount.ini,$nick,EXP) > 19000) {
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u12 %replyflood. [ $+ [ $chan ] ] ON 
      set -u12 %rpgflood. [ $+ [ $chan ] ] ON
      var %chan10 $chan
      var %md10 $rand(14,44)
      if ($readini(mnycount.ini,$nick,EXP) > 23000) {
        notice $nick 4You have beaten this level already. 
        HALT
      }
      ;--### Charm additions ###
      if ($readini(mnycount.ini,$nick,rpgcharm) == $null) { var %mkc10 1 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Loose Change) { var %mkc10 250 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Hoarding) { var %mkc10 400 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Fortuitous Fortunes) { var %mkc10 600 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Hunter) { var %mkc10 800 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Thieving) { var %mkc10 1000 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Trader) { var %mkc10 1200 }

      ;--### Armour additions ###
      if ($readini(mnycount.ini,$nick,rpgarmour) == $null) { var %mkw10 1 }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Leather) { var %mkw10 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hard Leather) { var %mka10 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Leather) { var %mka10 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Ring Mail) { var %mka10 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Mail) { var %mka10 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Steel Plate) { var %mka10 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hedge Knight) { var %mka10 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Horse Knight) { var %mka10 $rand(15,20) }

      ;--### Weapon additions ###
      if ($readini(mnycount.ini,$nick,rpgweapon) == $null) { var %mkw10 1 }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Staff) { var %mkw10 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Shortsword) { var %mkw10 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Spear) { var %mkw10 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Longsword) { var %mkw10 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Two-Handed Sword) { var %mkw10 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Fighting Axe) { var %mkw10 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Throwing Axe) { var %mkw10 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Twinblade Axe) { var %mkw10 $rand(15,20) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Halberd) { var %mkw10 $rand(18,23) }

      var %mk10 $calc(%mkw10 + %mka10 + $rand(1,22))
      var %rpgfight10 $calc($readini(mnycount.ini,$nick,FightNumber) + 1)
      writeini -n mnycount.ini $nick FightNumber $($+(%rpgfight10),2)

      ;####################################
      ;######## FAKEBOSS BATTLE 10 ########
      ;####################################
      if ($readini(mnycount.ini,$nick,EXP) >= 19000) && ($readini(mnycount.ini,$nick,EXP) < 19399) { 
        if (!%ONEfight10) {
          set -u4 %ONEfight10 on
          msg %chan10 4BOSS BATTLE!?!?7 $nick 10is being led down passageways by the7 Lords Assistant.  10He opens a door into darkness and bows to let them pass, pushing7 $nick 10into a deep hole as they enter.
          var %bossexpa10 $calc($readini(mnycount.ini,$nick,EXP) + 400)
          var %responsea10 $rand(1,5)
          if (%responsea10 == 1) {
            timer 1 5 msg %chan10 10The 7Lords Assistant10 led you into a trap!  He shouts gleefully as you fall: "My Lord is visiting the King!" You land heavily and get knocked unconsious...
            timer 1 10 msg %chan10 10When you wake and become accustomed to the darkness you are missing 310,000C10 and find youself deep in the 14Dungeons10. 4 40010 EXP to learn caution around people.
            var %spenta10 $calc($readini(mnycount.ini,$nick,money) - 10000)
            writeini -n mnycount.ini $nick money $($+(%spenta10),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexpa10),2)
            HALT 
          } 
          if (%responsea10 == 2) || (%responsea10 == 3) {
            timer 1 5 msg %chan10 7Lords Assistant10 led you into a trap! luckily you land well and wait a few moments for your eyes to adjust in the darkness...
            timer 1 10 msg %chan10 10You are in the 14Dungeons10, and you hear the Assistant above you gleefully shout down: "My Lord is visiting the King!" 4 40010 EXP.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            writeini -n mnycount.ini $nick EXP $($+(%bossexpa10),2)
            HALT
          }
          if (%responsea10 == 4) || (%responsea10 == 5) {
            timer 1 5 msg %chan10 7Lords Assistant10 led you into a trap! luckily you land well and wait a few moments for your eyes to adjust in the darkness, you spot a glint in the dirt...
            timer 1 10 msg %chan10 5You are in the 14Dungeons10, and you hear the Assistant above you gleefully shout down: "My Lord is visiting the King!" 10You found 7Lucky Ring Of Gold Theiving14(+31,000C 14for every win!)4 600 EXP 10gained.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            var %bossexpa10a $calc(%bossexpa10 + 200)
            if (!$readini(mnycount.ini,$nick,completed)) {
              writeini -n mnycount.ini $nick rpgcharm Gold Thieving 
            }
            writeini -n mnycount.ini $nick EXP $($+(%bossexpa10a),2)
            HALT
          }
        }
      }

      ;########################################
      ;######## LVL 10 SPECIFIC BATTLE! ########
      ;########################################
      if ($readini(mnycount.ini,$nick,EXP) > 19399) && ($readini(mnycount.ini,$nick,EXP) < 22850) {
        if (!%ONEfight10) {
          set -u4 %ONEfight10 on
          var %monsterloot10 $calc($rand(700,1200) + %mkc10)
          var %killmoney10 $calc($readini(mnycount.ini,$nick,money) + %monsterloot10)
          var %EXP10 $calc($rand(70,100) + %mka10 + %mkw10)
          var %expearnt10 $calc($readini(mnycount.ini,$nick,EXP) + %EXP10)
          var %monster10 $read(monsters10.txt)
          var %meet101 7 $+ $nick 10looks inside a 14Jail Cell10, meeting head on with :7 %monster10 $+ 7!!!
          var %meet102 7 $+ $nick 10makes their way through a dark corridor:7 %monster10  10hears you7!!!
          var %meet103 10wandering the dank 14Dungeon10,7 $nick 10is attacked by :7 %monster10 $+ 7!!!
          var %meet104 7 $+ $nick 10is looking around the 14Castle Dungeons10,  and spots :7 %monster10 $+ 7!!!
          var %meet105 7 $+ $nick $+ 10, unsure if they will every find their way out, finds:7 %monster10 10waiting for them7!!!
          msg %chan10 %meet10 [ $+ [ $r(1,5) ] ]
          echo -a Player = %mk10 {|} %md10 = Monster
          if (%md10 < %mk10) {  
            writeini -n mnycount.ini $nick EXP $($+(%expearnt10),2)
            writeini -n mnycount.ini $nick money $($+(%killmoney10),2)
            var %win101 7 %monster10 10was doomed before they began7 $nick 10attacks and defeats it!4 %EXP10 EXP10 and gained3 %monsterloot10 $+ C
            var %win102 7 %monster10 10was slain and7 $nick 10earned4 %EXP10 EXP10 and looted3 %monsterloot10 $+ C
            var %win103 10The7 %monster10 10died quickly and7 $nick 10moves on through 14Castle Dungeon10.4 %EXP10 EXP10 and gained3 %monsterloot10  C
            timer 1 4 msg %chan10 %win10 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md10 > %mk10) {
            var %lose101 7 %monster10 10vanished in the 14Castle10, hunting easier prey.  
            var %lose102 10You catch your foot on a 14skeleton10 and 7 %monster10 10escapes!
            var %lose103 7 %monster10 10managed to get away so you continue, looking for the 14Dungeon10 exit.
            timer 1 4 msg %chan10 %lose10 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md10 == %mk10) {
            var %sleepmoney10 $rand(800,2000)
            var %sleepmoneyz10 $calc($readini(mnycount.ini,$nick,money) - %sleepmoney10)
            var %tied101 10OH NO7 $nick 10& the7 %monster10 10struck, smacked each other in the head then fell unconscious. 10It got away and you lost some coins to 14Jailed10 thieves! 3 %sleepmoney10 $+ C10 Lost. 14(4!rpgstats14 for your details) 
            var %tied102 10OH NO7 $nick 10& the7 %monster10 4BOTH 10struck massive blows and drop to the stone ground. When you wake your money has shrunk! Someone stole3 %sleepmoney10 $+ C10 14(4!rpgstats14 for your details) 
            timer 1 5 msg %chan10 %tied10 [ $+ [ $r(1,2) ] ]
            writeini -n mnycount.ini $nick money $($+(%sleepmoneyz10),2)
            HALT
          }
        }
      }
      ;###############################
      ;######## BOSS BATTLE 10 ########
      ;###############################
      if ($readini(mnycount.ini,$nick,EXP) >= 22850) && ($readini(mnycount.ini,$nick,EXP) < 23000) { 
        if (!%ONEfight10) {
          set -u4 %ONEfight10 on
          msg %chan10 4BOSS BATTLE!!!!7 $nick 10comes face to face with7 Executioner!!!  10The huge wide axe in his hands drips with blood, and you are his next victim.
          var %bossexp10 $calc($readini(mnycount.ini,$nick,EXP) + 400)
          var %response10 $rand(1,5)
          if (%response10 == 1) {
            timer 1 5 msg %chan10 10The 7Executioner10 walks towards you, struggling to raise his heavy axe over his head...
            timer 1 10 msg %chan10 10You tell him you aren't meant to be here but he doesn't listen, until you pull out some money. 310,000C10 Lost to Bribe him. 4 400 EXP10.
            var %spent10 $calc($readini(mnycount.ini,$nick,money) - 10000)
            writeini -n mnycount.ini $nick money $($+(%spent10),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp10),2)
            HALT 
          } 
          if (%response10 == 2) || (%response10 == 3) {
            timer 1 5 msg %chan10 7 $+ $nick 10is not quite the hero they wish to be... The 7Executioner10 pauses as you plead for mercy but laughs and swings his axe...
            timer 1 10 msg %chan10 10He underestimates you and you step close, inside the swing to kick him between the legs and run out of the exit 4 400 EXP10. 10Next stop4:10 The 14City Streets10!
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp10),2)
            HALT
          }
          if (%response10 == 4) || (%response10 == 5) {
            timer 1 5 msg %chan10 10You speak calmly to the 7Executioner10 explaining how the 7Lord's Assistant10 threw you in here without reason, and how the 7Lord10 is away...
            timer 1 10 msg %chan10 10The 7Executioner10 points you to the exit and walks out with you. 7"4Time I had a holiday, that grumpy assistant doesn't tell me shit.7"10 He gives you a bag of money. 320000C10 from the corpses of beheaded criminals!4 400 EXP 10gained.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            var %bossexp10a $calc(%bossexp10 + 1)
            var %extracash10 $calc($readini(mnycount.ini,$nick,money) + 20000)
            writeini -n mnycount.ini $nick money $($+(%extracash10),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp10a),2)
            HALT
          }
        }
      }
    }
  }
  ; && ($chan != #Adultchat)
  ;#########################################################
  ;############################## LUCIUS
  ;######## RPG LEVEL 11 ######## LUCIUS
  ;############################## LUCIUS
  ;#########################################################
  if (!%rpgflood. [ $+ [ $chan ] ]) && ($2 == evil11) && ($readini(mnycount.ini,$nick,EXP) > 23000) {
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u12 %replyflood. [ $+ [ $chan ] ] ON 
      set -u12 %rpgflood. [ $+ [ $chan ] ] ON
      var %chan11 $chan
      var %md11 $rand(20,50)
      if ($readini(mnycount.ini,$nick,EXP) > 27000) {
        notice $nick 12You have beaten this level already. 
        HALT
      }
      ;--### Charm additions ###
      if ($readini(mnycount.ini,$nick,rpgcharm) == $null) { var %mkc11 1 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Loose Change) { var %mkc11 250 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Hoarding) { var %mkc11 400 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Fortuitous Fortunes) { var %mkc11 600 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Hunter) { var %mkc11 800 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Thieving) { var %mkc11 1000 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Trader) { var %mkc11 1200 }

      ;--### Armour additions ###
      if ($readini(mnycount.ini,$nick,rpgarmour) == $null) { var %mkw11 1 }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Leather) { var %mkw11 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hard Leather) { var %mka11 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Leather) { var %mka11 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Ring Mail) { var %mka11 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Mail) { var %mka11 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Steel Plate) { var %mka11 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hedge Knight) { var %mka11 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Horse Knight) { var %mka11 $rand(15,20) }

      ;--### Weapon additions ###
      if ($readini(mnycount.ini,$nick,rpgweapon) == $null) { var %mkw11 1 }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Staff) { var %mkw11 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Shortsword) { var %mkw11 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Spear) { var %mkw11 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Longsword) { var %mkw11 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Two-Handed Sword) { var %mkw11 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Fighting Axe) { var %mkw11 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Throwing Axe) { var %mkw11 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Twinblade Axe) { var %mkw11 $rand(15,20) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Halberd) { var %mkw11 $rand(18,23) }

      var %mk11 $calc(%mkw11 + %mka11 + $rand(1,22))
      var %rpgfight11 $calc($readini(mnycount.ini,$nick,FightNumber) + 1)
      writeini -n mnycount.ini $nick FightNumber $($+(%rpgfight11),2)

      ;####################################
      ;######## MEET BLIND SAGE 11 ########
      ;####################################
      if ($readini(mnycount.ini,$nick,EXP) >= 23000) && ($readini(mnycount.ini,$nick,EXP) < 23399) { 
        if (!%ONEfight11) {
          set -u4 %ONEfight11 on
          msg %chan11 12Chance encounter!?!7 $nick 10comes out of the dungeon jails through a secret door onto 14City streets10, a7 Blind Beggar 10speaks suddenly, and you know his words for truth.
          var %bossexpa11 $calc($readini(mnycount.ini,$nick,EXP) + 400)
          var %responsea11 $rand(1,5)
          if (%responsea11 == 1) {
            timer 1 5 msg %chan11 7"10The path will be long before you find the reason for your quest, and longer still with the knowledge. Fate guides your feet. You will become powerful and feared, trusted and betrayed.7"
            timer 1 10 msg %chan11 10You stand there daydreaming of riches and power, not noticing the thief who steals money from you. 310,000C10 lost! Growling to yourself you make your way through 14City streets10, leaving the 14Dungeons10 behind. 12 400 EXP10.
            var %spenta11 $calc($readini(mnycount.ini,$nick,money) - 10000)
            writeini -n mnycount.ini $nick money $($+(%spenta11),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexpa11),2)
            HALT 
          } 
          if (%responsea11 == 2) || (%responsea11 == 3) {
            timer 1 5 msg %chan11 7"10The path will be long before you find the reason for your quest, and longer still with the knowledge. Fate guides your feet. You will become powerful and feared, trusted and betrayed.7"
            timer 1 10 msg %chan11 10Blinking at the unasked for speech, you shake your head slightly and walk on, uncertain if you should believe it. 12 400 EXP10.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            writeini -n mnycount.ini $nick EXP $($+(%bossexpa11),2)
            HALT
          }
          if (%responsea11 == 4) || (%responsea11 == 5) {
            timer 1 5 msg %chan11 7"10The path will be long before you find the reason for your quest, and longer still with the knowledge. Fate guides your feet. You will become powerful and feared, trusted and betrayed.7"
            timer 1 10 msg %chan11 5You are stunned by the strange7 Blind Beggar10. On a whim you give him 31,000C but he gives it back and then hands you a weapon also! 10You found 7Weapon: Halberd!12 600 EXP 10gained. Onward through the 14City streets10!
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            var %bossexpa11a $calc(%bossexpa11 + 200)
            if (!$readini(mnycount.ini,$nick,completed)) {
              writeini -n mnycount.ini $nick rpgweapon Halberd
            }
            writeini -n mnycount.ini $nick EXP $($+(%bossexpa11a),2)
            HALT
          }
        }
      }

      ;########################################
      ;######## LVL 11 SPECIFIC BATTLE! ########
      ;########################################
      if ($readini(mnycount.ini,$nick,EXP) >= 23399) && ($readini(mnycount.ini,$nick,EXP) < 26850) {
        if (!%ONEfight11) {
          set -u4 %ONEfight11 on
          var %monsterloot11 $calc($rand(700,1200) + %mkc11)
          var %killmoney11 $calc($readini(mnycount.ini,$nick,money) + %monsterloot11)
          var %EXP11 $calc($rand(70,100) + %mka11 + %mkw11)
          var %expearnt11 $calc($readini(mnycount.ini,$nick,EXP) + %EXP11)
          var %monster11 $read(monsters11.txt)
          var %meet111 7 $+ $nick 10looks around the dark 14City alleyway10, meeting head on with :7 %monster11 $+ 7!!!
          var %meet112 7 $+ $nick 10makes their way in the night, down a deserted 14street:7 %monster11 10hears you7!!!
          var %meet113 10Winding roads confuse and disorientate, while reading a roadsign7 $nick 10is attacked by :7 %monster11 $+ 7!!!
          var %meet114 7 $+ $nick 10stops and sits on a wall in the 14City10, spotting :7 %monster11 $+ 7!!!
          var %meet115 7 $+ $nick $+ 10, keeping their direction towards the 14City 10gates as the walk on, finds:7 %monster11 10waiting for them7!!!
          msg %chan11 %meet11 [ $+ [ $r(1,5) ] ]
          echo -a Player = %mk11 {|} %md11 = Monster
          if (%md11 < %mk11) {  
            writeini -n mnycount.ini $nick EXP $($+(%expearnt11),2)
            writeini -n mnycount.ini $nick money $($+(%killmoney11),2)
            var %win111 7 %monster11 10never stood a chance.7 $nick 10attacks at high speed!4 %EXP11 EXP10 and gained3 %monsterloot11 $+ C
            var %win112 7 %monster11 10was slain and7 $nick 10earned4 %EXP11 EXP10 and looted3 %monsterloot11 $+ C
            var %win113 7 $nick 10moves on through 14City streets10, the7 %monster11 10died quickly and4 %EXP11 EXP10 gained, pocketed 3 %monsterloot11 $+ C
            timer 1 4 msg %chan11 %win11 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md11 > %mk11) {
            var %lose111 7 %monster11 10vanished down a dark 14alleyway10, hunting for one who won't fight back.  
            var %lose112 10Your foot slips on something rotting in the 14alleyway10 and 7 %monster11 10escapes!
            var %lose113 7 %monster11 10sees it's death in your eyes and runs away in fear.
            timer 1 4 msg %chan11 %lose11 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md11 == %mk11) {
            var %sleepmoney11 $rand(800,2000)
            var %sleepmoneyz11 $calc($readini(mnycount.ini,$nick,money) - %sleepmoney11)
            var %tied111 10OH NO7 $nick 10& the7 %monster11 10struck, smacked each other in the head, fell unconscious . 10It got away and you lost some coins to 14City10 thieves! 3 %sleepmoney11 $+ C10 Lost. 14(12!rpgstats14 for your details) 
            var %tied112 10OH NO7 $nick 10& the7 %monster11 12BOTH 10struck massive blows and drop to the ground. When you wake your money has shrunk! Someone stole3 %sleepmoney11 $+ C10 14(12!rpgstats14 for your details) 
            timer 1 5 msg %chan11 %tied11 [ $+ [ $r(1,2) ] ]
            writeini -n mnycount.ini $nick money $($+(%sleepmoneyz11),2)
            HALT
          }
        }
      }
      ;###############################
      ;######## BOSS BATTLE 11 ########
      ;###############################
      if ($readini(mnycount.ini,$nick,EXP) >= 26850) && ($readini(mnycount.ini,$nick,EXP) < 27000) { 
        if (!%ONEfight11) {
          set -u4 %ONEfight11 on
          msg %chan11 4BOSS BATTLE!!!!7 $nick 10comes face to face with7 Street Gang Leader!!!  10One of his gang starts towards you with a knife but the 7Leader10 steps up swinging an iron chain..
          var %bossexp11 $calc($readini(mnycount.ini,$nick,EXP) + 400)
          var %response11 $rand(1,5)
          if (%response11 == 1) {
            timer 1 5 msg %chan11 10The 7Leader10 walks towards you, and you spot tiny blades on the chain links as it spins closer...
            timer 1 10 msg %chan11 10You wait until he nears and reach into your pocket, pulling out some money.  The gang leap in as you fling the coins into the air... 310,000C10 lost to distract your enemies while you flee the 14City into the dawn. 4 400 EXP10.
            var %spent11 $calc($readini(mnycount.ini,$nick,money) - 10000)
            writeini -n mnycount.ini $nick money $($+(%spent11),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp11),2)
            HALT 
          } 
          if (%response11 == 2) || (%response11 == 3) {
            timer 1 5 msg %chan11 7 $+ $nick 10is not quite the hero yet... The 7Leader10 pauses as you plead for mercy but laughs and swings his barbed chain... 4"Weakling... I'll let you pass if you can defeat him!"
            timer 1 10 msg %chan11 10Out of the shadows comes a huge mountain-man with a warhammer... You run for your life into the dawn with laughter chasing you.4 400 EXP10. 10Next stop12:10 The 14City Streets10!
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp11),2)
            HALT
          }
          if (%response11 == 4) || (%response11 == 5) {
            timer 1 5 msg %chan11 10As morning dawns you speak calmly to the 7Leader10 explaining how the 7Lord's Assistant10 is running the 14City10 and how the 7Lord10 is away...
            timer 1 10 msg %chan11 10He stops for a moment and then tosses you a bag of coins. 4"It's castle raiding time boys! Leave my snitch here alone." 320000C10 for getting your own back on that nasty 14Castle assistant7.4 600 EXP 10gained.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            var %bossexp11a $calc(%bossexp11 + 200)
            var %extracash11 $calc($readini(mnycount.ini,$nick,money) + 20000)
            writeini -n mnycount.ini $nick money $($+(%extracash11),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp11a),2)
            HALT
          }
        }
      }
    }
  }
  ; !!!!!!!!!!!!!!!!!!!!!!!!!COPY IT FROM HERE DOOFUS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  ;#########################################################
  ;############################## LUCIUS
  ;######## RPG LEVEL 12 ######## LUCIUS
  ;############################## LUCIUS
  ;#########################################################
  if (!%rpgflood. [ $+ [ $chan ] ]) && ($2 == evil12) && ($readini(mnycount.ini,$nick,EXP) >= 27000) {
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u12 %replyflood. [ $+ [ $chan ] ] ON 
      set -u12 %rpgflood. [ $+ [ $chan ] ] ON
      var %chan12 $chan
      var %md12 $rand(20,58)
      if ($readini(mnycount.ini,$nick,EXP) > 32000) {
        notice $nick 12You have beaten this level already. 
        HALT
      }
      ;--### Charm additions ###
      if ($readini(mnycount.ini,$nick,rpgcharm) == $null) { var %mkc12 1 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Loose Change) { var %mkc12 250 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Hoarding) { var %mkc12 400 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Fortuitous Fortunes) { var %mkc12 600 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Hunter) { var %mkc12 800 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Gold Thieving) { var %mkc12 1000 }
      if ($readini(mnycount.ini,$nick,rpgcharm) == Trader) { var %mkc12 1200 }

      ;--### Armour additions ###
      if ($readini(mnycount.ini,$nick,rpgarmour) == $null) { var %mkw12 1 }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Leather) { var %mkw12 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hard Leather) { var %mka12 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Leather) { var %mka12 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Ring Mail) { var %mka12 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Plate Mail) { var %mka12 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Steel Plate) { var %mka12 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Hedge Knight) { var %mka12 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgarmour) == Horse Knight) { var %mka12 $rand(15,20) }

      ;--### Weapon additions ###
      if ($readini(mnycount.ini,$nick,rpgweapon) == $null) { var %mkw12 1 }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Staff) { var %mkw12 $rand(2,4) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Shortsword) { var %mkw12 $rand(3,6) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Spear) { var %mkw12 $rand(5,8) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Longsword) { var %mkw12 $rand(7,10) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Two-Handed Sword) { var %mkw12 $rand(9,12) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Fighting Axe) { var %mkw12 $rand(12,14) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Throwing Axe) { var %mkw12 $rand(13,17) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Twinblade Axe) { var %mkw12 $rand(15,20) }
      if ($readini(mnycount.ini,$nick,rpgweapon) == Halberd) { var %mkw12 $rand(18,23) }

      var %mk12 $calc(%mkw12 + %mka12 + $rand(5,22))
      var %rpgfight12 $calc($readini(mnycount.ini,$nick,FightNumber) + 1)
      writeini -n mnycount.ini $nick FightNumber $($+(%rpgfight12),2)

      ;########################################
      ;######## LVL 12 SPECIFIC BATTLE! ########
      ;########################################
      if ($readini(mnycount.ini,$nick,EXP) >= 27000) && ($readini(mnycount.ini,$nick,EXP) < 31850) {
        if (!%ONEfight12) {
          set -u4 %ONEfight12 on
          var %monsterloot12 $calc($rand(700,1200) + %mkc12)
          var %killmoney12 $calc($readini(mnycount.ini,$nick,money) + %monsterloot12)
          var %EXP12 $calc($rand(70,100) + %mka12 + %mkw12)
          var %expearnt12 $calc($readini(mnycount.ini,$nick,EXP) + %EXP12)
          var %monster12 $read(monsters12.txt)
          var %meet121 7 $+ $nick 10looks around the 6Travelling Freakshow10, meeting head on with :7 %monster12 $+ 7!!!
          var %meet122 7 $+ $nick 10walks in the morning air, through the 6Travelling Freak Show10:7 %monster12 10attacks you7!!!
          var %meet123 10A maze of 6Freak 10tents and stalls confuse, while trying to find the way through7 $nick 10is attacked by :7 %monster12 $+ 7!!!
          var %meet124 7 $+ $nick 10pauses, leaning on a large 6Freak10 tent, spotting :7 %monster12 $+ 7!!!
          var %meet125 7 $+ $nick $+ 10 keeps moving, scared by some of the stranger 6Freakies 10they back away, knocking into:7 %monster12 $+ 7!!!
          msg %chan12 %meet12 [ $+ [ $r(1,5) ] ]
          echo -a Player = %mk12 {|} %md12 = Monster
          if (%md12 < %mk12) {  
            writeini -n mnycount.ini $nick EXP $($+(%expearnt12),2)
            writeini -n mnycount.ini $nick money $($+(%killmoney12),2)
            var %win121 7 %monster12 $+ 10 $+ , too used to fighting 6Freaks10 can't withstand 7 $nick $+ 10's marginally more skillful attacks!4 %EXP12 EXP10 and gained3 %monsterloot12 $+ C
            var %win122 7 %monster12 10was slain and7 $nick 10earned4 %EXP12 EXP10 and looted3 %monsterloot12 $+ C
            var %win123 7 $nick 10mercifully puts7 %monster12 10out of it's torturous misery and4 %EXP12 EXP10 is gained, you also pocketed 3 %monsterloot12 $+ C
            timer 1 4 msg %chan12 %win12 [ $+ [ $r(1,3) ] ]
            HALT
          }
          if (%md12 > %mk12) {
            var %lose121 7 %monster12 10dissappears among the morning visitors, hunting for one who won't fight back.  
            var %lose121 7 %monster12 10escapes by ripping an exit into one of the 6Freakshow10 tents.
            var %lose122 10A 6flame juggler 10drops one fiery torch next to you and 7 %monster12 10escapes as you avoid being burnt!
            var %lose123 10A 6mind reader 10warns7 %monster12 10then blanks your memory for a moment and you suddenly stand alone!
            var %lose124 7 %monster12 10predicts it's death by your human hands and runs away.
            timer 1 4 msg %chan12 %lose12 [ $+ [ $r(1,4) ] ]
            HALT
          }
          if (%md12 == %mk12) {
            var %sleepmoney12 $rand(800,2000)
            var %sleepmoneyz12 $calc($readini(mnycount.ini,$nick,money) - %sleepmoney12)
            var %tied121 10OH NO!7 %monster12 10does something 6Freaky10 to your mind and you fall unconscious. 10It got away and you lost some coins to opportunistic thieves! 3 %sleepmoney12 $+ C10 Lost. 14(12!rpgstats14 for your details) 
            var %tied122 10OH NO!7 %monster12 10had backup! It takes a while but you escape and find money has shrunk! Someone stole3 %sleepmoney12 $+ C10 14(12!rpgstats14 for your details) 
            timer 1 5 msg %chan12 %tied12 [ $+ [ $r(1,2) ] ]
            writeini -n mnycount.ini $nick money $($+(%sleepmoneyz12),2)
            HALT
          }
        }
      }
      ;###############################
      ;######## BOSS BATTLE 12 ########
      ;###############################
      if ($readini(mnycount.ini,$nick,EXP) >= 31850) && ($readini(mnycount.ini,$nick,EXP) < 32000) { 
        if (!%ONEfight12) {
          set -u4 %ONEfight12 on
          msg %chan12 4BOSS BATTLE!!!!7 $nick 10finds themselves near the huge tent of7 Ring Master!!!  10He bars your way and wants to know why you are killing his shows!
          var %bossexp12 $calc($readini(mnycount.ini,$nick,EXP) + 400)
          var %response12 $rand(1,5)

          if (%response12 == 1) {
            timer 1 5 msg %chan12 10The 7Ring Master10 shouts at you about losing his attractions, threatening to cage you as 7The Limbless Wonder10...
            timer 1 10 msg %chan12 10With a sigh you reach into your funds and throw money at him to shut him up, in return he throws you out onto the roadside with the 3Grassy Plains10 ahead. 312,000C10 Lost. 12 400 EXP10.
            var %spent12 $calc($readini(mnycount.ini,$nick,money) - 12000)
            writeini -n mnycount.ini $nick money $($+(%spent12),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp12),2)
          } 
          if (%response12 == 2) || (%response12 == 3) {
            timer 1 5 msg %chan12 7 $+ $nick 10is not a hero yet... The 7Ring Master10 unfurls his whip as you ask for leniency, your pleas falling on deaf ears...
            timer 1 10 msg %chan12 10As the 6Freakshow10 packs up, the freaks laugh at you whimpering on the floor from the whip marks on your back.4 400 EXP10 earned hard 10Now onward to the 3Grassy Plains10! 14(after you have healed of course)
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp12),2)
          }
          if (%response12 == 4) || (%response12 == 5) {
            timer 1 5 msg %chan12 10You speak calmly to the 7Ring Master10 explaining that you were only defending yourself from attack and that you have a quest to complete...
            timer 1 10 msg %chan12 10He puts an arm around your shoulder and sneakily passes you a bag of money. Whispering in your ear, 4"Thanks. Those trouble makers have been stealing from me, so lets not mention suing anyone... Ok?" 320000C10 AND directions to the 3Grassy Plains in there too!4 600 EXP 10gained.
            timer 1 15 notice $nick 14 (7!rpgstats 10for more info.14)
            var %bossexp12a $calc(%bossexp12 + 200)
            var %extracash12 $calc($readini(mnycount.ini,$nick,money) + 20000)
            writeini -n mnycount.ini $nick money $($+(%extracash12),2)
            writeini -n mnycount.ini $nick EXP $($+(%bossexp12a),2)
          }
          ;---------THIS STAYS ON THE END!----------
          timer 1 18 notice $nick 10Congratulations, you've completed the game so far! If you would like to restart but keep all your purchases and stats, type: 7!restartrpg 10I will also log every time you finish the game! 14(7!rpgstats14)
          var %completedgame $calc($readini(mnycount.ini,$nick,completed) + 1)
          writeini -n mnycount.ini $nick completed $($+(%completedgame),2)
          HALT
          ;----------------------- DON'T FORGET TO ALTER !restartrpg EXP ( it's in above here somewhere, just CTRL+F !restartrpg )-----------
          ;AND when there's nothing to do, alter the blind sage to only upgrade (lvl 11)
        }
      }
    }  
  }
  ;----  final notice I'd like to thank napa182 and Typo for their help, it is 99% my work but their advice and snippets of code confirmation was invaluable.
  ;---- if you want to make more levels, copy it from above THIS STAYS ON THE END! up to COPY IT FROM HERE DOOFUS   (but you will have to replace closing and opening brackets)
  ;---- then you have to go through every line and change every 12 into a 13 for the vars, including 12a into 13a  and 112 into 113 etc.
  ;---- after that you will have to change the experience requirements on the ifs for the main fighting as well as the boss fighting.  
  ;---- and finally you have to make a new text file  called monster13.txt in the main irc folder and fill it with the monsters you want to add into it.
  ;---- IF you don't know enough about scripting you can destroy the whole thing, so be careful and make double sure you know what is what.

  HALT
}
on *:TEXT:*:#: {
  tokenize 32 $strip($1-)
  if (!%replyflood. [ $+ [ $chan ] ]) && ($left($1,1) != ~) { goto barend }
  if (!%replyflood. [ $+ [ $chan ] ]) && ($left($1,1) == ~) { 
    set -u4 %replyflood. [ $+ [ $chan ] ] ON 
    if (!$($+(%,barflood. [ $+ [ $chan ] ]),2)) {
      set -u2 $+(%,barflood. [ $+ [ $chan ] ]) on 
      var %% = $iif(!$2,$nick,$2)
      if ($left($1,1) == ~) && ($readini(mnycount.ini,$nick,money) < 50) { notice $nick You don't have enough money. TALK MORE!!! lol  |  HALT }
      if (~pepsi == $1) { describe $chan brings a nice cold Pepsi to %% 14[-35C14] }
      if (~drpepper == $1) { describe $chan brings a nice cold Dr Pepper to %% 14[-35C14] }
      if (~coke == $1) { describe $chan brings %% a freezing Coke 14[-35C14] }
      if (~dcoke == $1) { describe $chan brings %% a freezing Diet Coke 14[-35C14] }
      if (~taco == $1) { describe $chan hands %% a fresh tasty taco! 14[-35C14] }
      if (~slurpee == $1) { describe $chan brings %% a freezing Slurpee! 14[-35C14] }
      if (~rootbeer == $1) { describe $chan hands %% a A&W Root Beer 14[-35C14] }
      if (~sprite == $1) { describe $chan offers a Sprite to %% 14[-35C14] }
      if (~dew == $1) { describe $chan brings a Mountain Dew to %% 14[-35C14] }
      if (~rum == $1) { describe $chan brings a bottle full of rum to %% 14[-35C14] }
      if (~redwine == $1) { describe $chan takes a bottle full of chilled red wine to %% 14[-35C14] }
      if (~bud == $1) { decribe $chan hands a Bud Light to %% 14[-35C14] }
      if (~smoothie == $1) { describe $chan runs across the street to Jamba Juice and picks %% up a Strwberry Wirl 14[-35C14] }
      if (~cake == $1) { describe $chan hands %% a piece of homemade cake 14[-35C14] }
      if (~applepie == $1) { describe $chan hands %% a piece of hot Apple Pie 14[-35C14] }
      if (~cookie == $1) { describe $chan brings %% a cookie 14[-35C14] }
      if (~honybun == $1) { describe $chan brings %% a freshly baked Hony Bun 14[-35C14] }
      if (~coffee == $1) { describe $chan hands %% a hot coffee 14[-35C14] }
      if (~pancake == $1) { describe $chan hands %% a fresh steaming pancake! 14[-35C14] }
      if (~creamegg == $1) { describe $chan hands %% a little choccy egg of joy! 14[-35C14] }
      if (~hershey == $1) { describe $chan opens up a Hershey's bar for %% 14[-35C14] }
      if (~reese == $1) { describe $chan hands %% a Reece's bar 14[-35C14] }
      if (~klondike == $1) { describe $chan brings a frozen Klondike treat to %% 14[-35C14] }
      if (~snicker == $1) { describe $chan brings a Snicker's bar to %% 14[-35C14] }
      if (~burger == $1) { describe $chan hands %% a burger 14[-35C14] }
      if (~condom == $1) { describe $chan hands %% a condom, ribbed for pleasure (someone is hoping to get lucky!) 14[-35C14] }
      if (~cheeseburger == $1) { describe $chan makes a cheese burger for %% 14[-35C14] }
      if (~popcorn == $1) { describe $chan pops a bag of popcorn for %% 14[-35C14] }
      if (~peanuts == $1) { describe $chan passes a bag of peanuts to %% $+ ! 14[-35C14] }
      if (~hulahoops == $1) { describe $chan passes %% a bag of delicious HulaHoops! 14[-35C14] }
      if (~pbj == $1) { describe $chan hands %% a peanutbutter and jelly sandwhich 14[-35C14] }
      if (~wings == $1) { describe $chan brings a plate of hot, spicy wings to %% 14[-35C14] }
      if (~spagmeatballs == $1) { describe $chan brings %% a bowl of spagetti and meatballs 14[-35C14] }
      if (~mac&cheese == $1) { describe $chan hands a bowl of Mac and Cheese to %% 14[-35C14] }
      if (~whitewine == $1) { describe $chan gives %% a bottle full of white wine 14[-35C14] }
      if (~pizza == $1) { describe $chan hands %% a box of hot cheese pizza 14[-35C14] }
      if (~beer == $1) { describe $chan hands %% a fresh ice cold beer 14[-35C14] }
      if (~playboy == $1) { describe $chan hands %% a naughty magazine FULL of naked ladies! (and a complementary box of tissues) 14[-35C14] }
      if (~playgirl == $1) { describe $chan hands %% a naughty magazine FULL of naked men! (and a complementary box of tissues) 14[-35C14] }
      if (~wkd == $1) && ($3) { describe $chan hands $3 a fresh ice cold bottle of $2 WicKeD! 14[-35C14] }
      if (~wkd == $1) && (!$3) { describe $chan hands $nick a fresh ice cold bottle of $2 WicKeD! 14[-35C14] }
      if (~smokes == $1) { describe $chan hands %% a pack of smokes. $3- 14[-35C14] }
      if (~tequilla == $1) { describe $chan hands %% a fresh cool shot of Tequilla! (one tequilla, two tequilla, three tequilla, FLOOR!) 14[-35C14] }
      if (~jd == $1) && ($2 != $chr(38)) { describe $chan hands %% a fresh cool shot of JackDaniels 14[-35C14] }
      if (~jd == $1) && ($2 == $chr(38)) && (!$4) { describe $chan hands $nick a fresh cool glass of JackDaniels & $3 14[-35C14] }
      if (~jd == $1) && ($2 == $chr(38)) && ($4) { set %% $4 | describe $chan hands $4 a fresh cool glass of JackDaniels & $3 14[-35C14] }
      if (~crown == $1) && ($2 != $chr(38)) { describe $chan hands %% a fresh cool shot of Crown Whiskey 14[-35C14] }
      if (~crown == $1) && ($2 == $chr(38)) && (!$4) { describe $chan hands $nick a fresh cool glass of Crown Whiskey & $3 14[-35C14] }
      if (~crown == $1) && ($2 == $chr(38)) && ($4) { set %% $4 | describe $chan hands $4 a fresh cool glass of Crown Whiskey & $3 14[-35C14] }
      if (~nachos == $1) && ($2 != $chr(38)) { describe $chan hands %% Some crunchy nachos! 14[-35C14] }
      if (~nuke == $1) && ($2 != $chr(38)) { describe $chan shoves %% into a microwave! Ahhhh warm and toasty.  :] 14[-35C14] }
      if (~nachos == $1) && ($2 == $chr(38)) && (!$4) { describe $chan hands $nick some crunchy nachos & $3 dip! 14[-35C14] }
      if (~nachos == $1) && ($2 == $chr(38)) && ($4) { set %% $4 | describe $chan hands $4 some crunchy nachos & $3 dip! 14[-35C14] }
      if (~vodka == $1) && ($2 != $chr(38)) { describe $chan hands %% a fresh cool shot-glass of vodka 14[-35C14] }
      if (~vodka == $1) && ($2 == $chr(38)) && (!$4) { describe $chan hands $nick a fresh cool glass of vodka & $3 14[-35C14] }
      if (~vodka == $1) && ($2 == $chr(38)) && ($4) { set %% $4 | describe $chan hands $4 a fresh cool glass of vodka & $3 14[-35C14] }
      if (~clothe == $1) { describe $chan stuffs %% into $3- 14[-35C14] }
      if (~knife == $1) && ($readini(mnycount.ini,$nick,weapon) == knife) { notice $nick 5You already have a 7knife5, and you fail too much for wielding 2. | HALT }
      if (~knife == $1) && ($readini(mnycount.ini,$nick,LOSER) > 50) && ($readini(mnycount.ini,$nick,LOSER) < 100) && ($readini(mnycount.ini,$nick,money) > 1000) {
        writeini -n mnycount.ini $nick weapon knife
        var %buyweapon $calc($readini(mnycount.ini,$nick,money) - 1000)
        writeini -n mnycount.ini $nick money $($+(%buyweapon),2)
        notice $nick 5You bought a 7KNIFE!5 Maybe now you won't fail so much.
        HALT
      }
      if (~leather == $1) && ($readini(mnycount.ini,$nick,armour) == leather) { notice $nick 5You already have 7leather armour5, you can't wear 2. | HALT }
      if (~leather == $1) && ($readini(mnycount.ini,$nick,WINNER) > 100) && ($readini(mnycount.ini,$nick,WINNER) < 150) && ($readini(mnycount.ini,$nick,money) > 1000) {
        writeini -n mnycount.ini $nick armour leather
        var %buyweapon $calc($readini(mnycount.ini,$nick,money) - 1000)
        writeini -n mnycount.ini $nick money $($+(%buyweapon),2)
        notice $nick 5You bought 7Leather ARMOUR!5 Maybe now your many enemies will cry in defeat more oftem.
        HALT
      }
      if (~shortsword == $1) && ($readini(mnycount.ini,$nick,weapon) == shortsword) { .notice $nick 5You already have a 7shortsword5, and you fail too much for wielding 2. | HALT }
      if (~shortsword == $1) && ($readini(mnycount.ini,$nick,LOSER) > 150) && ($readini(mnycount.ini,$nick,LOSER) < 250) && ($readini(mnycount.ini,$nick,money) > 2000) {
        writeini -n mnycount.ini $nick weapon shortsword
        var %buyweapon $calc($readini(mnycount.ini,$nick,money) - 2000)
        writeini -n mnycount.ini $nick money $($+(%buyweapon),2)
        notice $nick 5You bought a 7Shortsword!5 Your thirst for blood shall be quenched.
        HALT
      }
      if (~ringmail == $1) && ($readini(mnycount.ini,$nick,armour) == ringmail) { notice $nick 5You already have 7ringmail armour5, you can't wear 2. | HALT }
      if (~ringmail == $1) && ($readini(mnycount.ini,$nick,WINNER) > 175) && ($readini(mnycount.ini,$nick,WINNER) < 250) && ($readini(mnycount.ini,$nick,money) > 2000) {
        writeini -n mnycount.ini $nick armour ringmail
        var %buyweapon $calc($readini(mnycount.ini,$nick,money) - 2000)
        writeini -n mnycount.ini $nick money $($+(%buyweapon),2)
        notice $nick 5You bought 7Ringmail ARMOUR!5 Maybe now your many enemies will cry in defeat more oftem.
        HALT
      }
      if ($left($1,1) == ~) { set ºrmoney $calc($readini(mnycount.ini,$nick,money) - 50) 
        if ($readini(mnycount.ini,$nick,money) > 50) {
          writeini -n mnycount.ini $nick money $($+(ºrmoney),2) 
          HALT
        } 
      }
    }
  }
  HALT
  :barend

  ;################################################ LUCIUS
  ;######### Home Made Slavery Script!! ########### LUCIUS
  ;################################################ LUCIUS

  if (.freeslave == $1) && ($nick == $hget(owned, $2)) {
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u4 %replyflood. [ $+ [ $chan ] ] ON 
      msg $chan 7 $nick 10just let7 $2 10go free4!10 They get 35000C 10from the local 4Anti-Slavery Group!
      hdel owned $2 
      var %freeslave $calc($readini(mnycount.ini,$nick,money) + 5000)
      writeini -n mnycount.ini $nick money %freeslave
      HALT
    }
  }
  if (.owns == $1) {
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u4 %replyflood. [ $+ [ $chan ] ] ON 
      if ($2 == NiHiLiSt) { msg $chan 10Haha, I am slave trader you can't own me. | HALT }
      if ($hget(owned, $2) == $null) { msg $chan 10Nobody owns7 $2 $+ !!! 10Someone slap some chains on that free spirit4!!! | HALT }
      if ($2) && (!$3) {
        if ($hget(owned, $2) == $2) { msg $chan 7 $2 10bought themselves so they are a free spirit7! 10But beware I will come get you if I have a buyer. 7:] | HALT }
        if ($hget(owned, $2) != $2) {
          set %zlaveowner1 7 $hget(owned, $2) 10owns 7 $2 $+ 4!!! 10And I hope they use the free whip they got on purchase7. 
          set %zlaveowner2 7 $hget(owned, $2) 10owns 7 $2 $+ 4!!! 10They whip that slave good and often7. 
          set %zlaveowner3 7 $hget(owned, $2) 10owns 7 $2 $+ 4!!! 10And I've never seen a more pampered slave7,10 methinks they want a concubine instead7!!! 
          set %zlaveowner4 7 $hget(owned, $2) 10owns 7 $2 $+ 4!!! 10Someone call human rights7,10 that slave is missing some limbs7!!
          set %zlaveowner5 7 $hget(owned, $2) 10owns 7 $2 $+ 4!!! 10Yet the whip goes unused7,10 someone teach them how it's done7!!! 
          msg $chan %zlaveowner [ $+ [ $r(1,5) ] ]
        HALT }
        else { msg $nick 10that is an invalid slave check7. 10To find out who owns someone type:  7-owns (slaves name) | HALT }
      }
    }
  }

  if (.myslaves == $1) {
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u4 %replyflood. [ $+ [ $chan ] ] ON 

      if (!$hfind(owned, $nick,1).data) { notice $nick 10You own no slaves!  |  HALT }
      if ($hfind(owned, $nick,1).data) { notice $nick 10Slaves in order of purchase7: 4 $hfind(owned, $nick,1).data $hfind(owned, $nick,2).data $hfind(owned, $nick,3).data $hfind(owned, $nick,4).data $hfind(owned, $nick,5).data $hfind(owned, $nick,6).data $hfind(owned, $nick,7).data $hfind(owned, $nick,8).data $hfind(owned, $nick,9).data $hfind(owned, $nick,10).data $hfind(owned, $nick,11).data $hfind(owned, $nick,12).data $hfind(owned, $nick,13).data $hfind(owned, $nick,14).data $hfind(owned, $nick,15).data $hfind(owned, $nick,16).data $hfind(owned, $nick,17).data $hfind(owned, $nick,18).data $hfind(owned, $nick,19).data $hfind(owned, $nick,20).data }
    }
  }
  if (.buy == $1) {
    if (!%replyflood. [ $+ [ $chan ] ]) {
      set -u4 %replyflood. [ $+ [ $chan ] ] ON 
      if ($2 == $me) { msg $chan 10Haha, I am slave trader you can't own me. | HALT }
      if ($readini(mnycount.ini,$nick,money) < 10000) { notice $nick 10~4laughs at $nick $+ 10~ 7"4YOU NEED 310,000C4 TO BUY A SLAVE7!" | HALT }
      if ($readini(mnycount.ini,$nick,money) > 10000) {
        if ($hget(owned, $2)) {
          if ($hget(owned, $nick) == $2) { notice $nick 10 They own you so you can't buy them! | HALT }
          if ($hget(owned, $2) == $nick) { msg $chan 10You already own $2 $+ 7... 4Idiot7. 10Guess you don't have to be smart to own a slave7. | HALT }
          var %x $hfind(owned,$2,0).data
          while (%x) {
            if ($hfind(owned,$2,%x).data == $2) {
              describe $chan 10chases down7 $2 10and takes back their freedom! 7"10You belong to7 $nick 10 now, 4SLAVE!7"
              var %ownself 1
            }
            dec %x
          }
        }
        if ($2 != $nick) && (!%ownself) && ($hget(owned, $2)) {
          describe $chan 10takes the deeds to7 $2 10from7 $hget(owned, $2) 10and gives them to7 $nick 10  4@ 310,000C 10 A resold slave4!!!7 $2 10is now7  $+ $nick $+ 's 4SLAVE 
          var %slavesellercash $calc($readini(mnycount.ini, [ $hget(owned, $2) ] ,money) + 5000)
          if ($hget(owned, $2) ison $chan) { notice $hget(owned, $2) 7 $+ $nick 10just bought your slave7 $2 $+ 10, but you get 035,000 10from the sale! }
          writeini -n mnycount.ini [ $hget(owned, $2) ] money $($+(%slavesellercash),2)
        }
        if (!$hget(owned, $2)) && (!%ownself) {
          describe $chan 10sells the deeds for7 $2 10to7 $nick  4@ 310,000C 10 First time buyer4!!!7 $2 10you are now7 $nick $+ 's 4SLAVE
        }
        if ($2 == $nick) && (!%ownself) {
          describe $chan 10 sighs7.10  Another slave buying themselves out of indenture7.10  But beware7,10 I will come get you if I have a buyer 7}:]
          var %slavesellercash $calc($readini(mnycount.ini, [ $hget(owned, $2) ] ,money) + 5000)
          if ($hget(owned, $2) ison $chan) { notice $hget(owned, $2) 7 $+ $nick 10just bought their freedom, but you get 035,000 10from the sale! }
          writeini -n mnycount.ini [ $hget(owned, $2) ] money $($+(%slavesellercash),2)
        } 
        hadd owned $2 [ $nick ]
        var %bought 1
      }
    }
    var %ownermoney $calc($readini(mnycount.ini,$nick,money) - 10000)
    if (%bought) {
      writeini -n mnycount.ini $nick money $($+(%ownermoney),2)  
    }
    HALT
  }
}

on *:disconnect:{ .hsave owned owned.hsh } 
on *:exit:{ .hsave owned owned.hsh }
on *:start:{ if (!$hget(owned)) { .hmake owned 100 | .hload owned owned.hsh } }
on *:load:{ 
  if (!$hget(owned)) { .hmake owned 100 | .hload owned owned.hsh  } 
  writeini mnycount.ini [ $me ] money 500000
}
