module MovieLogHelper
    def movie_logs_header(movie)
        if movie
            "Comments about #{movie.title}"
        else
            "All Movies"
        end
    end
end