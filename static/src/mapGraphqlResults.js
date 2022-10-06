export function edgesToArray(subqueryResult) {
  return !subqueryResult ? []: subqueryResult.edges.map(({ node }) => node)
}
