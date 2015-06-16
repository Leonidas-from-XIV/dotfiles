{:user {:plugins [[lein-kibit "0.1.2"]
                  [lein-exec "0.3.5"]
                  [venantius/ultra "0.3.3"]
                  [cider/cider-nrepl "0.8.2"]
                  [lein-ancient "0.6.7"]]
        :dependencies [[slamhound "1.5.5"]
                       [pr-foobar "0.1.1"]]
        :ultra {:color-scheme :solarized_dark}
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
