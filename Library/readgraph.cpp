inline void readgraph(vector<vector<int>>& g, int edges) {
    for(int i=0; i<edges; ++i) {
        int u, v;
        cin >> u >> v;
        // u--, v--;
        g[u].push_back[v];
        g[v].push_back[u];
    }
}
