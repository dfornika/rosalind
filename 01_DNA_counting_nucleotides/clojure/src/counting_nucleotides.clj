(ns counting-nucleotides
  (:require [clojure.string :as s]))

(defn read-stdin []
  (line-seq (java.io.BufferedReader. *in*)))

(defn count-item [counts item]
  (let [item-kw (keyword (str item))]
    (if (contains? counts item-kw)
      (update counts item-kw inc)
      (assoc counts item-kw 1))))

(defn format-output [item-counts]
  "Takes map {:a 1 :d 4 :c 3 :b 2} and returns space-delimited
   string of values in key-sorted order: '1 2 3 4'"
  (let [sorted-keys (sort (keys item-counts))]
    (->> item-counts
         ((apply juxt sorted-keys))
         (interpose " ")
         (apply str))))

(defn -main [& args]
  (->> (read-stdin)
       (mapcat s/trim-newline)
       (reduce count-item {})
       format-output
       println))
