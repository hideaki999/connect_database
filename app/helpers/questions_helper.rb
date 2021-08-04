module QuestionsHelper
    def placeholder_new_line_question
        <<-"EOS".strip_heredoc
            質問を入力してください

            マークダウン記法が使えます
            ```ruby or html or css
            コード
            ```
         EOS
    end

    def placeholder_new_line_answer
        <<-"EOS".strip_heredoc
            答えを入力してください

            マークダウン記法が使えます
            ```ruby or html or css
            コード
            ```
         EOS
    end
        
end
