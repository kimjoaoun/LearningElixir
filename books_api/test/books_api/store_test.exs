defmodule BooksApi.StoreTest do
  use BooksApi.DataCase

  alias BooksApi.Store

  describe "books" do
    alias BooksApi.Store.Book

    import BooksApi.StoreFixtures

    @invalid_attrs %{authors: nil, description: nil, isbn: nil, price: nil, title: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Store.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Store.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{authors: [], description: "some description", isbn: "some isbn", price: 120.5, title: "some title"}

      assert {:ok, %Book{} = book} = Store.create_book(valid_attrs)
      assert book.authors == []
      assert book.description == "some description"
      assert book.isbn == "some isbn"
      assert book.price == 120.5
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{authors: [], description: "some updated description", isbn: "some updated isbn", price: 456.7, title: "some updated title"}

      assert {:ok, %Book{} = book} = Store.update_book(book, update_attrs)
      assert book.authors == []
      assert book.description == "some updated description"
      assert book.isbn == "some updated isbn"
      assert book.price == 456.7
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_book(book, @invalid_attrs)
      assert book == Store.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Store.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Store.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Store.change_book(book)
    end
  end
end
