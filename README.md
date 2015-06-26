# mDevCamp 2015
## Jak zapezpečit Android aplikaci?
*Přijď a dozvíš se:*
- jaká máme data
- security model obecně a kde Android pomáhá
- co požadují různé security guidelines a jak jim vyhovět
- možnosti zabezpečení dat při přenosu i ukládání
- jak nástroje pomůžou
- re-kompilujeme aplikaci, použijeme její klíče, ukradneme identitu uživatele, vydáme malware
- zkusíme se tomu bránit

*Mrkni na abstrakt v programu* a [nezapomeň se zaregistrovat](http://mdevcamp.cz/program/)

<hr>

### Předpoklady pro dekompilaci APK
1. **Java JDK**
1. [dex2jar](http://code.google.com/p/dex2jar/)
1. [jd-gui](http://jd.benow.ca/)
1. [apktool 2.0.0](https://bitbucket.org/iBotPeaches/apktool/downloads)
1. framework-res.apk - z Android M Preview v repozitáři, také ve tvém zařízení ()

Projdeme celý [detailní postup](http://ibotpeaches.github.io/Apktool/documentation/). Další návod je na [xda-developers](http://forum.xda-developers.com/showthread.php?t=2213985) i na [stackoverflow](http://stackoverflow.com/a/6081365/632900).


**NEBO**

1. [decompileandroid.com](http://www.decompileandroid.com/)



### Předpoklady pro re-kompilaci
1. **Java JDK**
1. **Textový editor**, ideálně vývojové prostředí (Android Studio, Eclipse)
1. práce s příkazovou řádkou (apktool, jarsigner, keytool)
