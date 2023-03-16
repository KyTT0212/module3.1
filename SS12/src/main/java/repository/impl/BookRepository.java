package repository.impl;

import com.sun.scenario.effect.Crop;
import model.Authors;
import model.Books;
import model.Category;
import repository.IBookRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class BookRepository implements IBookRepository {

    @Override
    public List<Books> findALL() {
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Books> booksList = new ArrayList<>();

        if (connection != null){
            try {
//                preparedStatement = connection.prepareStatement("select * from books");
                preparedStatement = connection.prepareStatement("select * from books b" +
                        " join authors a on b.id_a = a.id_a" +
                        " join category c on c.id_c = b.id_c");
                resultSet = preparedStatement.executeQuery();

                Books books = null;
                while (resultSet.next()){
                    Integer id = resultSet.getInt("id_b");
                    String name = resultSet.getString("name_b");
                    Integer pageSize = resultSet.getInt("page_size");
                    Integer authorsID =resultSet.getInt("a.id_a");
                    String authorsName = resultSet.getString("name_a");
                    Authors authors = new Authors(authorsID,authorsName);
                    Integer categoryID = resultSet.getInt("c.id_c");
                    String categoryName = resultSet.getString("name_c");
                    Category category = new Category(categoryID,categoryName);
//                    Integer authors = resultSet.getInt("id_a");
//                    Integer category = resultSet.getInt("id_c");

                    books = new Books(id,name,pageSize,authors,category);
                    booksList.add(books);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
//            finally {
//                try {
//                    resultSet.close();
//                    preparedStatement.close();
//                } catch (SQLException e) {
//                    throw new RuntimeException(e);
//                }
//                BaseRepository.close();
//            }
        }

        return booksList;
    }

    @Override
    public void save(Books books) {
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = null;

        if (connection != null){
            try {
                preparedStatement = connection.prepareStatement("insert into books (id_b, name_b, page_size,id_a, id_c) values (?,?,?,?,?);");

                preparedStatement.setInt(1,books.getId());
                preparedStatement.setString(2,books.getName());
                preparedStatement.setInt(3,books.getPageSize());
                preparedStatement.setInt(4, books.getAuthors().getId());
                preparedStatement.setInt(5, books.getCategory().getId());
//                preparedStatement.setInt(4,books.getAuthors());
//                preparedStatement.setInt(5,books.getCategory());

                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
//            finally {
//                try {
//                    preparedStatement.close();
//                } catch (SQLException e) {
//                    throw new RuntimeException(e);
//                }
//                BaseRepository.close();
//            }
        }


    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("delete from books where id_b = ?");

                preparedStatement.setInt(1,id);
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
