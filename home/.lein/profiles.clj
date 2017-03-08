{:user
 {:plugins
  [[lein-clojars "0.9.1"]
   [lein-kibit "0.1.2" :exclusions [org.clojure/clojure]]
   [lein-ancient "0.6.8" :exclusions [org.clojure/clojure org.clojure/tools.reader]]
   [jonase/eastwood "0.2.3" :exclusions [org.clojure/clojure]]
   [lein-describe "0.2.0"]
   [lein-try "0.4.3"]
   [lein-deploy-deps "0.1.0"]
   [com.jakemccrary/lein-test-refresh "0.18.0"]]


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

 :repl
 {:plugins
  [[refactor-nrepl "2.0.0"]
   [cider/cider-nrepl "0.9.1" :exclusions [org.clojure/tools.namespace]]]

  :dependencies
  [[javert "0.2.0-SNAPSHOT"]
   [clj-stacktrace "0.2.8"]
   [cljfmt "0.5.3" :exclusions [org.clojure/clojure org.clojure/clojurescript]]
   [ritz/ritz-nrepl-middleware "0.7.0"]
   [org.clojure/tools.namespace "0.2.10"]
   [slamhound "1.5.5"]
   [com.cemerick/piggieback "0.2.1"]
   [org.clojure/tools.nrepl "0.2.10"]
   [figwheel-sidecar "0.5.0-2"]]

  :injections
  [(require '[clojure.string :as string])
   (require '[clojure.pprint :refer [pprint]])]

  :repl-options
  {:nrepl-middleware
   [inspector.middleware/wrap-inspect
    ritz.nrepl.middleware.javadoc/wrap-javadoc
    ritz.nrepl.middleware.apropos/wrap-apropos
    cemerick.piggieback/wrap-cljs-repl]}}}

