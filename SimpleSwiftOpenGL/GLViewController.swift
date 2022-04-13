import UIKit
import GLKit

class GLViewController: GLKViewController {
    private var context: EAGLContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGL()
    }

    private func setupGL() {
      context = EAGLContext(api: .openGLES3)
      EAGLContext.setCurrent(context)
      if let view = self.view as? GLKView, let context = context {
        view.context = context
        delegate = self
      }
    }

    private func tearDownGL() {
      EAGLContext.setCurrent(context)

      // delete any GL resources.

      EAGLContext.setCurrent(nil)

      context = nil
    }

    override func glkView(_ view: GLKView, drawIn rect: CGRect) {
      glClearColor(0.85, 0.85, 0.85, 1.0)
      glClear(GLbitfield(GL_COLOR_BUFFER_BIT))
    }

    deinit {
      tearDownGL()
    }
}

extension GLViewController: GLKViewControllerDelegate {
  func glkViewControllerUpdate(_ controller: GLKViewController) {

  }
}
