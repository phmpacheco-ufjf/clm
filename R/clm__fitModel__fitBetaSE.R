fitBetaSE <- function(fit) {
  side_term <- rlist::list.map(fit$individuals, wi * t(xi) %*% solve(fit$sigma) %*% xi) %>%
    Reduce("+", .) %>%
    solve(.)

  middle_term <- fit$individuals %>%
    rlist::list.group(hi, ji) %>%
    lapply(., function(hii) {
      lapply(hii, function(jii) rlist::list.map(jii, wi * t(xi) %*% solve(fit$sigma) %*% resi)) %>%
        rlist::list.map(Reduce("+", .)) %>%
        `attr<-`(., "mh", rlist::list.count(.)) %>%
        `attr<-`(., "Zh_bar", Reduce("+", .) / attr(., "mh")) %>%
        lapply(., function(Zhj) {
          (attr(., "mh") / (attr(., "mh") - 1)) * (Zhj - attr(., "Zh_bar")) %*% t(Zhj - attr(., "Zh_bar"))
        }) %>%
        Reduce("+", .)
    }) %>%
    Reduce("+", .)

  se <- as.matrix(diag((side_term %*% middle_term %*% side_term)^0.5))
  colnames(se) <- "se"

  return(se)
}
