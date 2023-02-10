require 'json'

class WriteService
  def set_student(age, name, parent_permission, id)
    return if !File.exist?('./people.json')
    file = File.open('./people.json')
    student_obj = {
      type: 'Student',
      age: age,
      name: name,
      parent_permission: parent_permission,
      id: id,
    }
    if file.size.zero?
      student_list = [student_obj]
    else
      student_list = JSON.parse(File.read('./people.json'))
      student_list << student_obj
    end
    file.close
    customize_file = File.open('./people.json', 'w')
    customize_file.write(JSON.generate(student_list))
    customize_file.close
  end

  # teacher

  def set_teacher(specialization, age, name, id, parent_permission: true)
    return if !File.exist?('./people.json')
    file = File.open('./people.json')

    teacher_obj = {
      type: 'Teacher',
      specialization: specialization,
      age: age,
      name: name,
      parent_permission: parent_permission,
      id: id,
    }
    if file.size.zero?
      teacher_list = [teacher_obj]
    else
      teacher_list = JSON.parse(File.read('./people.json'))
      teacher_list << teacher_obj
    end
    file.close
    customize_file = File.open('./people.json', 'w')
    customize_file.write(JSON.generate(teacher_list))
    customize_file.close
  end

  # rentals

  def set_rental(date, book, person)
    return if !File.exist?('./rental.json')
    file = File.open('./rental.json')

    rental_obj = {
      date: date,
      title: book.title,
      author: book.author,
      age: person.age,
      name: person.name,
      type: person.class,
      parent_permission:
        person.class === 'Teacher' ? true : person.parent_permission,
      specialization: person.class === 'Teacher' ? person.specialization : '',
    }
    if file.size.zero?
      rental_list = [rental_obj]
    else
      rental_list = JSON.parse(File.read('./rental.json'))
      rental_list << rental_obj if !rental_list.include? rental_obj
    end
    file.close
    customize_file = File.open('./rental.json', 'w')
    customize_file.write(JSON.generate(rental_list))
    customize_file.close
  end

  def set_books(title, author)
    return if !File.exist?('./book.json')
    file = File.open('./book.json')

    book_obj = { title: title, author: author }
    if file.size.zero?
      book_list = [book_obj]
    else
      book_list = JSON.parse(File.read('./book.json'))
      book_list << book_obj if !book_list.include? book_obj
    end
    file.close
    customize_file = File.open('./book.json', 'w')
    customize_file.write(JSON.generate(book_list))
    customize_file.close
  end
end
