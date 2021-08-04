class Question < ApplicationRecord

    has_many :answers,dependent: :destroy
    has_many :tag_maps, dependent: :destroy
    has_many :tags, through: :tag_maps,dependent: :destroy
    accepts_nested_attributes_for :answers


    def self.search(keyword)
        where('question like?', "#{keyword}%")
    end

    def save_tag(sent_tags)
        current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
        old_tags = current_tags - sent_tags
        new_tags = sent_tags - current_tags

        old_tags.each do |old|
            self.tags.delete Tag.find_by(tag_name: old)
        end
 
        new_tags.each do |new|
            new_post_tag = Tag.find_or_create_by(tag_name: new)
            # find_or_create_by条件を指定して1件もない場合は、作成する
            # つまり、newにはdbにない新しいタグがきているので、dbになければ作成している
            self.tags << new_post_tag
        end
    end
end
