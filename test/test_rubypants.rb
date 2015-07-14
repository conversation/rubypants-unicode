# encoding: utf-8
require 'test/unit'
require 'rubypants-unicode'

# Test EVERYTHING against SmartyPants.pl output!
class TestRubyPants < Test::Unit::TestCase
  def assert_rp_equal(str, orig, options=[2])
    assert_equal orig, RubyPantsUnicode.new(str, options).to_html
  end

  def assert_verbatim(str)
    assert_rp_equal str, str
  end

  def test_verbatim
    assert_verbatim "foo!"
    assert_verbatim "<div>This is HTML</div>"
    assert_verbatim "<div>This is HTML with <crap </div> tags>"
    assert_verbatim <<EOF
multiline

<b>html</b>

code

EOF
  end

  def test_quotes
    assert_rp_equal '"A first example"', '“A first example”'
    assert_rp_equal '"A first "nested" example"',
                    '“A first “nested” example”'

    assert_rp_equal '".', '”.'
    assert_rp_equal '"a', '“a'

    assert_rp_equal "'.", '’.'
    assert_rp_equal "'a", '‘a'

    assert_rp_equal %{<p>He said, "'Quoted' words in a larger quote."</p>},
    "<p>He said, “‘Quoted’ words in a larger quote.”</p>"

    assert_rp_equal %{"I like the 70's"}, '“I like the 70’s”'
    assert_rp_equal %{"I like the '70s"}, '“I like the ’70s”'
    assert_rp_equal %{"I like the '70!"}, '“I like the ‘70!”'

    assert_rp_equal 'pre"post', 'pre”post'
    assert_rp_equal 'pre "post', 'pre “post'
    assert_rp_equal 'pre&nbsp;"post', 'pre&nbsp;“post'
    assert_rp_equal 'pre--"post', 'pre–“post'
    assert_rp_equal 'pre--"!', 'pre–”!'

    assert_rp_equal "pre'post", 'pre’post'
    assert_rp_equal "pre 'post", 'pre ‘post'
    assert_rp_equal "pre&nbsp;'post", 'pre&nbsp;‘post'
    assert_rp_equal "pre--'post", 'pre–‘post'
    assert_rp_equal "pre--'!", 'pre–’!'

    assert_rp_equal "<b>'</b>", "<b>‘</b>"
    assert_rp_equal "foo<b>'</b>", "foo<b>’</b>"

    assert_rp_equal '<b>"</b>', "<b>“</b>"
    assert_rp_equal 'foo<b>"</b>', "foo<b>”</b>"
  end

  def test_dashes
    assert_rp_equal "foo--bar", 'foo—bar', 1
    assert_rp_equal "foo---bar", 'foo—-bar', 1
    assert_rp_equal "foo----bar", 'foo——bar', 1
    assert_rp_equal "foo-----bar", 'foo——-bar', 1
    assert_rp_equal "--foo--bar--quux--",
                    '—foo—bar—quux—', 1

    assert_rp_equal "foo--bar", 'foo–bar', 2
    assert_rp_equal "foo---bar", 'foo—bar', 2
    assert_rp_equal "foo----bar", 'foo----bar', 2
    assert_rp_equal "foo-----bar", 'foo-----bar', 2
    assert_rp_equal "--foo--bar--quux--",
                    '–foo–bar–quux–', 2

    assert_rp_equal "foo--bar", 'foo—bar', 3
    assert_rp_equal "foo---bar", 'foo–bar', 3
    assert_rp_equal "foo----bar", 'foo–-bar', 3
    assert_rp_equal "foo-----bar", 'foo–—bar', 3
    assert_rp_equal "--foo--bar--quux--",
                    '—foo—bar—quux—', 3
  end

  def test_ellipses
    assert_rp_equal "foo..bar", 'foo..bar'
    assert_rp_equal "foo...bar", 'foo…bar'
    assert_rp_equal "foo....bar", 'foo….bar'

    # Nasty ones
    assert_rp_equal "foo. . ..bar", 'foo….bar'
    assert_rp_equal "foo. . ...bar", 'foo. . …bar'
    assert_rp_equal "foo. . ....bar", 'foo. . ….bar'
  end

  def test_backticks
    assert_rp_equal "pre``post", 'pre“post'
    assert_rp_equal "pre ``post", 'pre “post'
    assert_rp_equal "pre&nbsp;``post", 'pre&nbsp;“post'
    assert_rp_equal "pre--``post", 'pre–“post'
    assert_rp_equal "pre--``!", 'pre–“!'

    assert_rp_equal "pre''post", 'pre”post'
    assert_rp_equal "pre ''post", 'pre ”post'
    assert_rp_equal "pre&nbsp;''post", 'pre&nbsp;”post'
    assert_rp_equal "pre--''post", 'pre–”post'
    assert_rp_equal "pre--''!", 'pre–”!'
  end

  def test_single_backticks
    o = [:oldschool, :allbackticks]

    assert_rp_equal "`foo'", "‘foo’", o

    assert_rp_equal "pre`post", 'pre‘post', o
    assert_rp_equal "pre `post", 'pre ‘post', o
    assert_rp_equal "pre&nbsp;`post", 'pre&nbsp;‘post', o
    assert_rp_equal "pre--`post", 'pre–‘post', o
    assert_rp_equal "pre--`!", 'pre–‘!', o

    assert_rp_equal "pre'post", 'pre’post', o
    assert_rp_equal "pre 'post", 'pre ’post', o
    assert_rp_equal "pre&nbsp;'post", 'pre&nbsp;’post', o
    assert_rp_equal "pre--'post", 'pre–’post', o
    assert_rp_equal "pre--'!", 'pre–’!', o
  end

  def test_stupefy
    o = [:stupefy]

    assert_rp_equal "<p>He said, “‘Quoted’ words " +
                    "in a larger quote.”</p>",
                    %{<p>He said, "'Quoted' words in a larger quote."</p>}, o

    assert_rp_equal "– — ‘’ “” …",
                    %{- -- '' "" ...}, o

    assert_rp_equal %{- -- '' "" ...}, %{- -- '' "" ...}, o
  end

  def test_process_escapes
    assert_rp_equal %q{foo\bar}, "foo\\bar"
    assert_rp_equal %q{foo\\\bar}, "foo&#92;bar"
    assert_rp_equal %q{foo\\\\\bar}, "foo&#92;\\bar"
    assert_rp_equal %q{foo\...bar}, "foo&#46;..bar"
    assert_rp_equal %q{foo\.\.\.bar}, "foo&#46;&#46;&#46;bar"

    assert_rp_equal %q{foo\'bar}, "foo&#39;bar"
    assert_rp_equal %q{foo\"bar}, "foo&#34;bar"
    assert_rp_equal %q{foo\-bar}, "foo&#45;bar"
    assert_rp_equal %q{foo\`bar}, "foo&#96;bar"

    assert_rp_equal %q{foo\#bar}, "foo\\#bar"
    assert_rp_equal %q{foo\*bar}, "foo\\*bar"
    assert_rp_equal %q{foo\&bar}, "foo\\&bar"
  end

  def test_html_comments

    assert_rp_equal "-->", "-->"
    assert_rp_equal "-->", "-->", [:oldschool]
    assert_rp_equal "-->", "-->", [:inverted]

  end

end
