require 'jsl/shell_lexer'

=begin
 I'm not going to test what already existed, just my changes.
 Mostly because I don't know bash that well,
 but also because I feel like I'll wind up refactoring most of it, and don't want to do that.
 Their testing on this class is pretty poor, though, TBH.
 Maybe they were in the same boat as me and just ported the pygments one, idk

 Links
 a good reference for Bash    https://www.gnu.org/software/bash/manual/html_node/index.html#SEC_Contents
 Bash homepage (I think)      https://www.gnu.org/software/bash/
 Bash source code homepage    http://savannah.gnu.org/projects/bash
 Bash git repo                http://git.savannah.gnu.org/r/bash.git
 Pygments shell highlighting  https://bitbucket.org/birkenfeld/pygments-main/src/41771329a71bc4ab86b0d4412d5933d95b658dfd/pygments/lexers/shell.py?at=default
=end

RSpec.describe Jsl::ShellLexer do
  it 'is titled "Jsl Shell"' do
    expect(described_class.title).to eq 'Jsl Shell'
  end

  describe 'it is registered for' do
    def registered_for(lang)
      expect(Rouge::Lexer.find lang).to eq described_class
    end
    specify('zsh')  { registered_for 'zsh'  }
    specify('bash') { registered_for 'bash' }
    specify('sh')   { registered_for 'sh'   }
  end

  # Returns something like this:
  # [[<Token Generic.Prompt>, "$ "], [<Token Text>, "a"]]
  def lex(code_string)
    described_class.new.lex(code_string).to_a
  end

  def tokens_for(code_string)
    lex(code_string).map(&:first)
  end

  def texts_for(code_string)
    lex(code_string).map(&:last)
  end

  def token(name)
    Rouge::Token.cache[name]
  end

  describe 'output' do
    let(:output_token) { token 'Generic.Output' }
    it 'considers lines beginning with \s*#\s*>>\s* to be output' do
      tokens = tokens_for 'a'
      expect(tokens.size).to eq 1
      expect(tokens.first).to_not eq output_token

      expect(tokens_for '# >>omg').to eq [output_token]
      expect(tokens_for ' #  >>     omg').to eq [output_token]
    end

    it 'omits the \s*#\s*>> from the output' do
      expect(texts_for '  #  >>output').to eq ['output']
    end

    it 'outdents the lines such that the line with the least indentation determines the indentation for the block' do
      expect(texts_for "# >> a\n# >> b").to eq ["a\nb"]
      expect(texts_for "# >>  a\n# >> b").to eq [" a\nb"]
      expect(texts_for "# >> a\n# >>  b").to eq ["a\n b"]
    end

    it 'does not accidentally remove "indentation" from within the line' do
      expect(texts_for "# >> a  b").to eq ["a  b"]
    end

    it 'ignores "\s*>>\s*\n" lines when identifying the comment block\'s indentation' do
      expect(texts_for "# >>  a\n"\
                       "# >>\n"   \
                       "# >> \n"  \
                       "# >>  b\n").to eq ["a\n\n\nb\n"]
    end

    it 'does not interfere with comments' do
      expect(lex '# a').to eq [[token('Comment'), '# a']]
    end
  end

  # here were some tests I'd conceived of before I realized I didn't want ot spend my time testing their implementation
  # describe 'commands' do
  #   it 'considers the first word of a line to be the command'
  #   it 'does not consider keywords to be commands'
  #   it 'considers the remaining words to be arguments'
  #   it 'considers arguments that begin with a dash to be flags'
  #   it 'considers arguments that begin with a cash to be interpolations'
  #   it 'stops considering arguments at newlines, semicolons, pipes, close parentheses'
  #   it 'continues considering arguments on the next line, if the current line ends with a backslash'
  # end

  # describe 'analyze_text' do
  #   it 'returns 1 (which is presumably "true") for a shebang matching bash, sh, or zsh'
  # end

  # describe 'prompts' do
  #   it 'considers a $ at the beginning of a line to be a prompt'
  #   it 'considers > at the beginning of a line to be a prompt'
  # end

  # describe 'comments' do
  #   it 'considers lines that begin with octothorpes to be comments'
  # end

  # describe 'keywords' do
  # end
end
