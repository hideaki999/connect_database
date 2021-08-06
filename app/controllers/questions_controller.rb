class QuestionsController < ApplicationController

    def index
        @questions = Question.all
        @tag_list = Tag.all 
    end

    def new
        @question = Question.new
        @question.answers.build
    end

    def create
        question = Question.new(question_params)
        tag_list = params[:question][:tag_name].split(nil)
        if question.save
            question.save_tag(tag_list)
            redirect_to action: 'index'
        else
            redirect_to action: 'index'
        end
    end

    def destroy
        Question.find(params[:id]).destroy
        @question_searchs = Question.search(params[:keyword])
        @questions = Question.all
        @tag_list = Tag.all 
    end

    def edit
        @question = Question.find(params[:id])
        @tags = @question.tags
    end

    def update
        @question = Question.find(params[:id])
        tag_list = params[:question][:tag_name].split(nil)
        if @question.update(update_question_params)
            @question.save_tag(tag_list)
            redirect_to root_path
        else
            render :edit
        end  
    end


    def search
        @question_searchs = Question.search(params[:keyword])
        @keyword_hidden = params[:keyword]
        @questions = Question.all 
        @tag_list = Tag.all
    end

    def tag_search
        @tag_list = Tag.all  
        @tag = Tag.find(params[:tag_id])  
        @questions = @tag.questions.all 
    end



    private
    def question_params
        params.require(:question).permit(:question,answers_attributes: [:question_id, :answer])
    end

    def update_question_params
        params.require(:question).permit(:question,answers_attributes: [:question_id,:id,:answer])
    end
end
