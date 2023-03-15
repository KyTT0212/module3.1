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
                preparedStatement = connection.prepareStatement("select * from books");
                resultSet = preparedStatement.executeQuery();

                Books books = null;
                while (resultSet.next()){
                    Integer id = resultSet.getInt("id_b");
                    String name = resultSet.getString("name_b");
                    Integer pageSize = resultSet.getInt("page_size");
//                    Authors authors = (Authors) resultSet.getObject("id_a");
//                    Category category = (Category) resultSet.getObject("id_c");
                    Integer authors = resultSet.getInt("id_a");
                    Integer category = resultSet.getInt("id_c");

                    books = new Books(id,name,pageSize,authors,category);
                    booksList.add(books);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                BaseRepository.close();
            }
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
                preparedStatement.setInt(4,books.getAuthors());
                preparedStatement.setInt(5,books.getCategory());

                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                BaseRepository.close();
            }
        }


    }
}
