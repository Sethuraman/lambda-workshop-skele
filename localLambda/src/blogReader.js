import axios from 'axios'

export default blogId =>
	axios.get(`http://jsonplaceholder.typicode.com/posts/${blogId}`)
		.then(response => response.data)
		.catch(error => {
			console.error("Error occurred while calling the blog api", error.message);
			return Promise.reject({
					errors: [
						{
							title: 'Blog not found'
						}
					]
			})
		});
