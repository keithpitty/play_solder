module PlaySolder
  class Image < Fake

    def generate
      cmd = "convert -background \\#{ random_colour }"
      cmd += " -size 200x100 -gravity center"
      cmd += %Q{ label:"#{ text }" }
      cmd += %Q{ "#{ faked_file }" }
      system(cmd)
      faked_file
    end

    def random_colour
      comps = []
      6.times { comps << random_component }
      "##{ comps.join }"
    end

    def random_component
      (3..13).sort_by { rand }.first.to_s(16)
    end

  end
end
