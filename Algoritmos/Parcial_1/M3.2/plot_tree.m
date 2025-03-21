function plot_tree(G, selected_edges)
    n = size(G, 1);
    G_tree = zeros(n);
    for i = 1:size(selected_edges, 1)
        u = selected_edges(i, 1);
        v = selected_edges(i, 2);
        G_tree(u, v) = G(u, v);
        G_tree(v, u) = G(u, v);
    end
    % Crear un objeto de gráfico de red
    tree_graph = graph(G_tree);
    % Plotear el árbol de expansión mínima
    figure;
    plot(tree_graph, 'EdgeLabel', tree_graph.Edges.Weight);
    title('Árbol de Expansión Mínima');
end
