{:user {:plugins [[lein-kibit "0.1.2"]
                  [lein-exec "0.3.5"]
                  [venantius/ultra "0.3.3"]
                  [cider/cider-nrepl "0.8.2"]
                  [refactor-nrepl "0.3.0-SNAPSHOT"]
                  [lein-ancient "0.6.7"]]
        :dependencies [[alembic "0.3.2"]
                       [org.clojure/tools.nrepl "0.2.7"]
                       [slamhound "1.5.5"]
                       [pr-foobar "0.1.1"]]
        :ultra {:color-scheme :solarized_dark}
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
