{:user
 {:plugins
  [[lein-clojars "0.9.1"]
   [lein-deploy-deps "0.1.0"]
   [com.jakemccrary/lein-test-refresh "0.24.1"]]

  :dependencies
  [[clj-stacktrace "0.2.8"]
   [pjstadig/humane-test-output "0.7.1" :exclusions  [[org.clojure/clojure]]]
   [org.clojure/tools.namespace "0.2.10"]]

  :injections
  [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                          'print-cause-trace)
         new (ns-resolve (doto 'clj-stacktrace.repl require)
                         'pst)]
     (alter-var-root orig (constantly (deref new))))

   (require 'pjstadig.humane-test-output)
   (pjstadig.humane-test-output/activate!)]

  :test-refresh
  {:notify-command ["terminal-notifier" "-title" "Tests" "-message"]
   :changes-only true
   :quiet true}}

 #_#_
 :repl
 {:plugins
  [[refactor-nrepl "2.3.0-SNAPSHOT"]
   [cider/cider-nrepl "0.15.0-SNAPSHOT"]]

  :dependencies
  [[org.clojure/tools.nrepl "0.2.12" :exclusions [org.clojure/clojure]]]

  :injections
  [(require '[clojure.string :as string])
   (require '[clojure.pprint :refer [pprint]])] }}

