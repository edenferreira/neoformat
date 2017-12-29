function! neoformat#formatters#clojure#enabled() abort
    return ['cljfmt']
endfunction

function! neoformat#formatters#clojure#cljfmt() abort
    return {
        \ 'exe': 'lein-exec-e',
        \ "args": [shellescape('(require (quote [cljfmt.core])) (->> (java.io.BufferedReader. *in*) line-seq (clojure.string/join "\n") cljfmt.core/reformat-string println)')],
        \ 'stdin': 1,
        \ 'env': ['LEIN_SUPPRESS_USER_LEVEL_REPO_WARNINGS=true']
        \ }
endfunction
