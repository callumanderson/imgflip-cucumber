Feature: meme_creation
  In order view my meme
  As a troll
  I want an image page for each meme I generate

  Background: Navigate_to_imgflip.com
    Given I am viewing the imgflip memegenerator

  Scenario Outline: create_simple_meme_from_template
    When I generate a meme from template with "<top_line>", "<bottom_line>"
    Then my meme should be created
    When I go to the image page
    Then I should see my meme
    And my text "<top_line>", "<bottom_line>" should be displayed on the image page

    Examples:
      | top_line | bottom_line |
      | one does not simply | walk into mordor |

  Scenario Outline: create_memes_with_reserved_strings
    When I generate a meme from template with "<top_line>", "<bottom_line>"
    Then my meme should be created
    When I go to the image page
    Then I should see my meme
    And my text "<top_line>" should be displayed on the image page

    Examples:
      | top_line | bottom_line |
      | one does not simply | walk into mordor |
      | undefined |  |
      | undef |  |
      | null |  |
      | NULL |  |
      | (null) |  |
      | nil |  |
      | NIL |  |
      | true |  |
      | false |  |
      | True |  |
      | False |  |
      | None |  |

  Scenario Outline: create_memes_with_numeric_strings
    When I generate a meme from template with "<top_line>", "<bottom_line>"
    Then my meme should be created
    When I go to the image page
    Then I should see my meme
    And my text "<top_line>" should be displayed on the image page

    Examples:
    | top_line | bottom_line |
      | 0 |  |
      | 1 |  |
      | 1.00 |  |
      | $1.00 |  |
      | 1/2 |  |
      | 1E2 |  |
      | 1E02 |  |
      | 1E+02 |  |
      | -1 |  |
      | -1.00 |  |
      | -$1.00 |  |
      | -1/2 |  |
      | -1E2 |  |
      | -1E02 |  |
      | -1E+02 |  |
      | 1/0 |  |
      | 0/0 |  |
      | -2147483648/-1 |  |
      | -9223372036854775808/-1 |  |
      | 0.00 |  |
      | 0..0 |  |
      | . |  |
      | 0.0.0 |  |
      | 0,00 |  |
      | 0,,0 |  |
      | , |  |
      | 0,0,0 |  |
      | 0.0/0 |  |
      | 1.0/0.0 |  |
      | 0.0/0.0 |  |
      | 1,0/0,0 |  |
      | 0,0/0,0 |  |
      | --1 |  |
      | - |  |
      | -. |  |
      | -, |  |
      | 999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999 |  |
      | NaN |  |
      | Infinity |  |
      | -Infinity |  |
      | INF |  |
      | 1#INF |  |
      | -1#IND |  |
      | 1#QNAN |  |
      | 1#SNAN |  |
      | 1#IND |  |
      | 0x0 |  |
      | 0xffffffff |  |
      | 0xffffffffffffffff |  |
      | 0xabad1dea |  |
      | 123456789012345678901234567890123456789 |  |
      | 1,000.00 |  |
      | 1 000.00 |  |
      | 1'000.00 |  |
      | 1,000,000.00 |  |
      | 1 000 000.00 |  |
      | 1'000'000.00 |  |
      | 1.000,00 |  |
      | 1 000,00 |  |
      | 1'000,00 |  |
      | 1.000.000,00 |  |
      | 1 000 000,00 |  |
      | 1'000'000,00 |  |
      | 01000 |  |
      | 08 |  |
      | 09 |  |
      | 2.2250738585072011e-308 |  |

       Scenario Outline: create_simple_meme_with_ascii
         When I generate a meme from template with "<top_line>", "<bottom_line>"
         Then my meme should be created
         When I go to the image page
         Then I should see my meme
         And my text "<top_line>" should be displayed on the image page

         Examples:
           | top_line | bottom_line |
           | !@#$%^&*()`~ | |
           |,./;'[]\-=| |
           |!@#$%^&*()`~| |

          Scenario Outline: create_simple_meme_with_superscript_subscript
            When I generate a meme from template with "<top_line>", "<bottom_line>"
            Then my meme should be created
            When I go to the image page
            Then I should see my meme
            And my text "<top_line>" should be displayed on the image page

            Examples:
              | top_line | bottom_line |
             | ⁰⁴⁵ |  |
             |₀₁₂| |
             |⁰⁴⁵₀₁₂| |
             |⁰⁴⁵|₀₁₂|


           Scenario Outline: create_simple_meme_with_two_byte_chars
             When I generate a meme from template with "<top_line>", "<bottom_line>"
             Then my meme should be created
             When I go to the image page
             Then I should see my meme
             And my text "<top_line>" should be displayed on the image page

             Examples:
              | top_line | bottom_line |
              |田中さんにあげて下さい|  |
              |和製漢語| |
              |部落格| |
              |사회과학원 어학연구소| |
              |찦차를 타고 온 펲시맨과 쑛다리 똠방각하| |
              |社會科學院語學研究所| |
              |울란바토르| |
              #  |𠜎𠜱𠝹𠱓𠱸𠲖𠳏| | -> This one actually crashes chromedriver with "unknown error: ChromeDriver only supports characters in the BMP"

           Scenario Outline: create_simple_meme_with_emoticons
             When I generate a meme from template with "<top_line>", "<bottom_line>"
             Then my meme should be created
             When I go to the image page
             Then I should see my meme
             And my text "<top_line>" should be displayed on the image page

             Examples:
              | top_line | bottom_line |
              |ヽ༼ຈل͜ຈ༽ﾉ ヽ༼ຈل͜ຈ༽ﾉ | |
              |(｡◕ ∀ ◕｡)| |
              |｀ｨ(´∀｀∩| |
              |__ﾛ(,_,*)| |
              |・(￣∀￣)・:*:| |
              |ﾟ･✿ヾ╲(｡◕‿◕｡)╱✿･ﾟ| |
              |,。・:*:・゜’( ☻ ω ☻ )。・:*:・゜’| |
              |(╯°□°）╯︵ ┻━┻)  | |
              |(ﾉಥ益ಥ）ﾉ﻿ ┻━┻| |
              |( ͡° ͜ʖ ͡°)| |

            #
            # Unfortunately chromedriver doesn't support these characters. Not enough time to find a workaround
            # But maunal testing suggests they are not correctly rendered on the meme
            #
            # Scenario Outline: create_simple_meme_with_emoji
            #   When I generate a meme from template with "<top_line>", "<bottom_line>"
            #   Then my meme should be created

            #   Examples:
            #    | top_line | bottom_line |
            #    |😍| |
            #    |👩🏽| |
            #    |👾 🙇 💁 🙅 🙆 🙋 🙎 🙍 | |
            #    |🐵 🙈 🙉 🙊| |
            #    |❤️ 💔 💌 💕 💞 💓 💗 💖 💘 💝 💟 💜 💛 💚 💙| |
            #    |✋🏿 💪🏿 👐🏿 🙌🏿 👏🏿 🙏🏿| |
            #    |🚾 🆒 🆓 🆕 🆖 🆗 🆙 🏧| |
            #    |0️⃣ 1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣ 🔟| |

            # Unfortunately these characters actually break gherkin - not enough time to fully debug why
            #Scenario Outline: create_simple_meme_with_regional_indicators
            #  When I generate a meme from template with "<top_line>", "<bottom_line>"
            #  Then my meme should be created

            #  Examples:
            #   | top_line | bottom_line |
            #   |🇺🇸🇷🇺🇸 🇦🇫🇦🇲🇸 | |                                                                                          |
            #   |🇺🇸🇷🇺🇸🇦🇫🇦🇲 | |
            #   |🇺🇸🇷🇺🇸🇦| |

            # Should be displayed as numbers if app is localized
            Scenario Outline: create_simple_meme_with_unicode_numbers
              When I generate a meme from template with "<top_line>", "<bottom_line>"
              Then my meme should be created
              When I go to the image page
              Then I should see my meme
              And my text "<top_line>" should be displayed on the image page

              Examples:
               | top_line | bottom_line |
               |１２３| |
               |١٢٣| |

               Scenario Outline: create_simple_meme_with_right_to_left_strings
                 When I generate a meme from template with "<top_line>", "<bottom_line>"
                 Then my meme should be created
                 When I go to the image page
                 Then I should see my meme
                 And my text "<top_line>" should be displayed on the image page

               Examples:
               | top_line | bottom_line |
               |ثم نفس سقطت وبالتحديد،, جزيرتي باستخدام أن دنو. إذ هنا؟ الستار وتنصيب كان. أهّل ايطاليا، بريطانيا-فرنسا قد أخذ. سليمان، إتفاقية بين ما, يذكر الحدود أي بعد, معاملة بولندا، الإطلاق عل إيو.| |
               |בְּרֵאשִׁית, בָּרָא אֱלֹהִים, אֵת הַשָּׁמַיִם, וְאֵת הָאָרֶץ||
               |הָיְתָהtestالصفحات التّحول| |
               |﷽| |
               |ﷺ| |
               |مُنَاقَشَةُ سُبُلِ اِسْتِخْدَامِ اللُّغَةِ فِي النُّظُمِ الْقَائِمَةِ وَفِيم يَخُصَّ التَّطْبِيقَاتُ الْحاسُوبِيَّةُ، | |

               Scenario Outline: create_simple_meme_with_unicode_font
                 When I generate a meme from template with "<top_line>", "<bottom_line>"
                 Then my meme should be created
                 When I go to the image page
                 Then I should see my meme
                 And my text "<top_line>" should be displayed on the image page

               Examples:
               | top_line | bottom_line |
               #	Strings which contain bold/italic/etc. versions of normal characters
               |Ｔｈｅ ｑｕｉｃｋ ｂｒｏｗｎ ｆｏｘ ｊｕｍｐｓ ｏｖｅｒ ｔｈｅ ｌａｚｙ ｄｏｇ| |
               # The below aren't supported by chromedriver
               #|𝐓𝐡𝐞 𝐪𝐮𝐢𝐜𝐤 𝐛𝐫𝐨𝐰𝐧 𝐟𝐨𝐱 𝐣𝐮𝐦𝐩𝐬 𝐨𝐯𝐞𝐫 𝐭𝐡𝐞 𝐥𝐚𝐳𝐲 𝐝𝐨𝐠| |
               #|𝕿𝖍𝖊 𝖖𝖚𝖎𝖈𝖐 𝖇𝖗𝖔𝖜𝖓 𝖋𝖔𝖝 𝖏𝖚𝖒𝖕𝖘 𝖔𝖛𝖊𝖗 𝖙𝖍𝖊 𝖑𝖆𝖟𝖞 𝖉𝖔𝖌| |
               #|𝑻𝒉𝒆 𝒒𝒖𝒊𝒄𝒌 𝒃𝒓𝒐𝒘𝒏 𝒇𝒐𝒙 𝒋𝒖𝒎𝒑𝒔 𝒐𝒗𝒆𝒓 𝒕𝒉𝒆 𝒍𝒂𝒛𝒚 𝒅𝒐𝒈| |
               #|𝓣𝓱𝓮 𝓺𝓾𝓲𝓬𝓴 𝓫𝓻𝓸𝔀𝓷 𝓯𝓸𝔁 𝓳𝓾𝓶𝓹𝓼 𝓸𝓿𝓮𝓻 𝓽𝓱𝓮 𝓵𝓪𝔃𝔂 𝓭𝓸𝓰| |
               #|𝕋𝕙𝕖 𝕢𝕦𝕚𝕔𝕜 𝕓𝕣𝕠𝕨𝕟 𝕗𝕠𝕩 𝕛𝕦𝕞𝕡𝕤 𝕠𝕧𝕖𝕣 𝕥𝕙𝕖 𝕝𝕒𝕫𝕪 𝕕𝕠𝕘| |
               #|𝚃𝚑𝚎 𝚚𝚞𝚒𝚌𝚔 𝚋𝚛𝚘𝚠𝚗 𝚏𝚘𝚡 𝚓𝚞𝚖𝚙𝚜 𝚘𝚟𝚎𝚛 𝚝𝚑𝚎 𝚕𝚊𝚣𝚢 𝚍𝚘𝚐| |
               #|⒯⒣⒠ ⒬⒰⒤⒞⒦ ⒝⒭⒪⒲⒩ ⒡⒪⒳ ⒥⒰⒨⒫⒮ ⒪⒱⒠⒭ ⒯⒣⒠ ⒧⒜⒵⒴ ⒟⒪⒢| |



               Scenario Outline: create_simple_meme_with_xss
                 When I generate a meme from template with "<top_line>", "<bottom_line>"
                 Then my meme should be created
                 When I go to the image page
                 Then I should see my meme
                 And my text "<top_line>" should be displayed on the image page

               Examples:
               | top_line | bottom_line |
               |<script>alert(123)</script>| |
               |&lt;script&gt;alert(&#39;123&#39;);&lt;/script&gt;| |
               |<img src=x onerror=alert(123) />| |
               |<svg><script>123<1>alert(123)</script> | |
               |'><script>alert(123)</script>| |
               |><script>alert(123)</script>| |
               |</script><script>alert(123)</script>| |
               |< / script >< script >alert(123)< / script >| |
               | onfocus=JaVaSCript:alert(123) autofocus | |
               |' onfocus=JaVaSCript:alert(123) autofocus | |
               |＜script＞alert(123)＜/script＞| |
               |<sc<script>ript>alert(123)</sc</script>ript>| |
               |--><script>alert(123)</script>| |
               |';alert(123);t='| |
               |JavaSCript:alert(123)| |
               |;alert(123);| |
               |src=JaVaSCript:prompt(132)| |
               |'><script>alert(123);</script x='| |
               |><script>alert(123);</script x=| |
               |' autofocus onkeyup='javascript:alert(123)| |
               |<a href=java&#1&#2&#3&#4&#5&#6&#7&#8&#11&#12script:javascript:alert(1)>XXX</a>| |
               |<title onpropertychange=javascript:alert(1)></title><title title=>| |
               |<!--[if]><script>javascript:alert(1)</script -->| |
               |<!--[if<img src=x onerror=javascript:alert(1)//]> -->| |
               |<IMG SRC=javascript:alert(String.fromCharCode(88,83,83))>| |
               |<IMG SRC=&#106;&#97;&#118;&#97;&#115;&#99;&#114;&#105;&#112;&#116;&#58;&#97;&#108;&#101;&#114;&#116;&#40;&#39;&#88;&#83;&#83;&#39;&#41;>| |
               |<IMG SRC=&#0000106&#0000097&#0000118&#0000097&#0000115&#0000099&#0000114&#0000105&#0000112&#0000116&#0000058&#0000097&#0000108&#0000101&#0000114&#0000116&#0000040&#0000039&#0000088&#0000083&#0000083&#0000039&#0000041>| |
               |<IMG SRC=&#x6A&#x61&#x76&#x61&#x73&#x63&#x72&#x69&#x70&#x74&#x3A&#x61&#x6C&#x65&#x72&#x74&#x28&#x27&#x58&#x53&#x53&#x27&#x29>| |
               |<SCRIPT SRC=//ha.ckers.org/.j>| |
               |<iframe src=http://ha.ckers.org/scriptlet.html <| |
               |<u oncopy=alert()> Copy me</u>| |
               |<i onwheel=alert(1)> Scroll over me </i>| |
               |<plaintext>| |
               |http://a/%%30%30| |

               Scenario Outline: create_simple_meme_with_sql_injection
                 When I generate a meme from template with "<top_line>", "<bottom_line>"
                 Then my meme should be created
                 When I go to the image page
                 Then I should see my meme
                 And my text "<top_line>" should be displayed on the image page

               Examples:
               | top_line | bottom_line |
               |1;DROP TABLE users| |
               |1'; DROP TABLE users-- 1| |
               |' OR 1=1 -- 1| |
               |' OR '1'='1| |
               |%| |
               |_| |


               Scenario Outline: create_simple_meme_with_strings_to_pull_files
                 When I generate a meme from template with "<top_line>", "<bottom_line>"
                 Then my meme should be created
                 When I go to the image page
                 Then I should see my meme
                 And my text "<top_line>" should be displayed on the image page

               Examples:
               | top_line | bottom_line |
               |../../../../../../../../../../../etc/passwd%00| |
               |../../../../../../../../../../../etc/hosts| |

               @now
               Scenario Outline: create_simple_meme_with_ios_breaking_string
                 When I generate a meme from template with "<top_line>", "<bottom_line>"
                 Then my meme should be created
                 When I go to the image page
                 Then I should see my meme
                 And my text "<top_line>" should be displayed on the image page

               Examples:
               | top_line | bottom_line |
               |Powerلُلُصّبُلُلصّبُررً ॣ ॣh ॣ ॣ冗| |
