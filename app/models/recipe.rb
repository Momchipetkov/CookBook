class Recipe < ActiveRecord::Base
    has_attached_file :icon, :styles => {:thumb => "50x50>", :small => "300x300#", :big => "450x450>"},
                  :url  => "/assets/icons/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/icons/:id/:style/:basename.:extension"

    validates_attachment_presence :icon
    validates_attachment_size :icon, :less_than => 5.megabytes
    validates_attachment_content_type :icon, :content_type => ['image/jpeg', 'image/png']
    validates :name, presence: { message: " missing" }
    validates :description, presence: { message: " missing" }


    def self.search_recipe(name)
        recipes = self.where(
            ["name LIKE :word",
                {:word => "%#{name}%"}
            ]
        )

        return recipes
    end

end
