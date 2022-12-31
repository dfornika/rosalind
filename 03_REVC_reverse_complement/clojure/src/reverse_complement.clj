(ns reverse-complement
  (:require [clojure.string :as s]))

(defn read-stdin []
  (line-seq (java.io.BufferedReader. *in*)))

(def dna-complement {\A \T
                 \C \G
                 \G \C
                 \T \A})

(defn -main [& args]
  (->> (read-stdin)
       first
       reverse
       (map dna-complement)
       (apply str)
       println))
