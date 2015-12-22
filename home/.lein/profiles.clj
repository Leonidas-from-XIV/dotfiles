{:repl {:plugins [[cider/cider-nrepl "0.11.0-SNAPSHOT"]
                  [refactor-nrepl "2.0.0-SNAPSHOT"]]
        :dependencies [[alembic "0.3.2"]
                       [org.clojure/tools.nrepl "0.2.12" :exclusions [org.clojure/clojure]]]}
 :user {:plugins [[lein-kibit "0.1.2" :exclusions [org.clojure/clojure]]
                  [lein-exec "0.3.5"]
                  [lein-ancient "0.6.7" :exclusions [org.clojure/clojure]]]
        :dependencies [[slamhound "1.5.5"]
                       [pr-foobar "0.1.1"]]
        :ultra {:color-scheme :solarized_dark}
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
