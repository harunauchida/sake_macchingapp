class SakesController < ApplicationController
    def index
        @sakes = Sake.all
    end
end
