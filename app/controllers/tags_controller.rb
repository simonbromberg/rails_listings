class TagsController < ApplicationController
def index
	@tags = Tag.order('name ASC').all
end
end
