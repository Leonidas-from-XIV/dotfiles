{:user {:plugins [[cider/cider-nrepl "0.25.6"]
                  [lein-kibit "0.1.8" :exclusions [org.clojure/clojure]]]
        :dependencies [[hashp "0.2.0"]]
        :injections [(require 'hashp.core)]}}
