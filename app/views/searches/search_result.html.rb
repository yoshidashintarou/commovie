<h2>Results index</h2>

<table class="table table-hover table-inverse">
  <% if @range == "User" %>
    <tbody>
      <% @users.each do |user| %>
        <tr>
          <td><%= user.name %></td>
        </tr>
      <% end %>
    </tbody>
  <% else %>
    <tbody>
      <% @movies.each do |movie| %>
        <tr>
          <td><%= movie.title %></td>
          <td><%= movie.body %></td>
        </tr>
      <% end %>
    </tbody>
  <% end %>
</table>