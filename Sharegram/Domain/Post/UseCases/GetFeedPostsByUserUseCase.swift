import Foundation

extension Domain.Post.UseCase {
    public class GetPostsByUser {
        private let postRepository: PostRepositoryProtocol
        private let userRepository: UserRepositoryProtocol
        
        init(
            postRepository: PostRepositoryProtocol = DataSource.Post.RepositoryImpl(),
            userRepository: UserRepositoryProtocol = DataSource.User.RepositoryImpl()
        ) {
            self.postRepository = postRepository
            self.userRepository = userRepository
        }
        
        public func execute(userId: String) async throws -> [Domain.Post.Model.Post] {
            var posts: [Domain.Post.Model.Post] = try await postRepository.getUserPosts(uid: userId)
            
            for i in 0..<posts.count {
                let post = posts[i]
                let postUser = try await userRepository.getUser(byId: post.ownerUid)
                posts[i].user = postUser
            }
            
            return posts
        }
    }
}
